class FollowersController < ApplicationController
  def index
    @github_followers = GithubFollowers.new(current_user.screen_name, session[:token])
  end
end
