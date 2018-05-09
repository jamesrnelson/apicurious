class FollowingController < ApplicationController
  def index
    @git_hub_following = GitHubFollowing.new(current_user.screen_name, session[:token])
  end
end
