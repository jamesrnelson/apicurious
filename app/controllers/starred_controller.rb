class StarredController < ApplicationController
  def index
    @github_starred = GithubConnection.new(current_user.screen_name, '/starred', session[:token])
  end
end
