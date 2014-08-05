require 'rails_helper'
include Devise::TestHelpers

RSpec.describe User, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"


  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_uniqueness_of(:username) }


  # describe "#follows?" do
  #   it "returns true if the user has a following relationship with another user" do
  #     alice = Fabricate(:user)
  #     bob = Fabricate(:user)
  #     Fabricate(:relationship, leader: bob, follower: alice)
  #     expect(alice.follows?(bob)).to be_true
  #   end
  #
  #   it "returns false if the user does not have a following relationship w/ another user" do
  #     alice = Fabricate(:user)
  #     bob = Fabricate(:user)
  #     Fabricate(:relationship, leader: alice, follower: bob)
  #     expect(alice.follows?(bob)).to be_false
  #   end
  # end

end
