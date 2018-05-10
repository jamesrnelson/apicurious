class ReposController < ApplicationController
  def index
    @github_repos = GithubConnection.new(current_user.screen_name, '/repos', session[:token])
  end
end
