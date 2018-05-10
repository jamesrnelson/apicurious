class FollowersController < ApplicationController
  def index
    @github_followers = GithubConnection.new(current_user.screen_name, '/followers', session[:token])
  end
end
