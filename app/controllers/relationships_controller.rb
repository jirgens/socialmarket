class RelationshipsController < InheritedResources::Base
  actions :delete, :show
  # before_filter :require_user  doesn't work with devise tests


  def index
    @relationships = current_user.following_relationships
  end

  def destroy
    relationship = Relationship.find(params[:id])
    relationship.destroy if relationship.follower == current_user
    redirect_to following_path
  end

  def create
    leader = User.find(params[:leader_id])
    Relationship.create(leader_id: params[:leader_id], follower: current_user) if current_user.can_follow?(leader)
    redirect_to following_path
  end
end
