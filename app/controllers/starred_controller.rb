class StarredController < ApplicationController
  def index
    @github_starred = GitHubStarred.new(current_user.screen_name, session[:token])
  end
end
