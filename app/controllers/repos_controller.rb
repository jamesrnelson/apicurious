class ReposController < ApplicationController
  def index
    @github_repos = GitHubRepos.new(current_user.screen_name, session[:token])
  end
end
