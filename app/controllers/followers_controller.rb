class FollowersController < ApplicationController
  def index
    @github_followers = GitHubFollowers.new(current_user.screen_name, session[:token])
  end
end
