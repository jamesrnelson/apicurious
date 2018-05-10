class ReposController < ApplicationController
  def index
    @github_repos = Repositories.new(current_user.screen_name, session[:token], '/repos')
  end
end
