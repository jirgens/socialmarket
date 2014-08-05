require 'rails_helper'
  include Devise::TestHelpers


describe RelationshipsController do
  it_behaves_like_a_devise_controller

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe "GET index" do
    it "sets @relationships to the current user's following relationships" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      relationship = Fabricate(:relationship, follower: alice, leader: bob)
      get :index
      expect(assigns(:relationships)).to eq([relationship])
    end
  end

  describe "DELETE destroy" do
    it "deletes the relationship if the current user is the follower" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      relationship = Fabricate(:relationship, follower: alice, leader: bob)
      delete :destroy, id: relationship
      expect(Relationship.count).to eq(0)
    end

    it "redirects to the Following page" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      relationship = Fabricate(:relationship, follower: alice, leader: bob)
      delete :destroy, id: relationship
      expect(response).to redirect_to following_path
    end

    it "does not delete the realtionship if the current user is not the follower" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      charlie = Fabricate(:user)
      relationship = Fabricate(:relationship, follower: charlie, leader: bob)
      delete :destroy, id: relationship
      expect(Relationship.count).to eq(1)
    end
  end

  describe "POST create" do
    it "creates a relationship that the current user follows the leader" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      post :create, leader_id: bob.id
      expect(alice.following_relationships.last.leader).to eq(bob)
    end

    it "redirects to the following page" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      post :create, leader_id: bob.id
      expect(response).to redirect_to following_path
    end

    it "does not create a relationship if the current user alrady follows leader" do
      alice = Fabricate(:user)
      sign_in(alice)
      bob = Fabricate(:user)
      Fabricate(:relationship, leader: bob, follower: alice)
      post :create, leader_id: bob.id
      expect(Relationship.count).to eq(1)
    end


    it "does not allow one to follow themself" do
      alice = Fabricate(:user)
      sign_in(alice)
      post :create, leader_id: alice.id
      expect(Relationship.count).to eq(0)
    end
  end




end
