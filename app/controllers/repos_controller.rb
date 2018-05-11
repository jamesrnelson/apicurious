class ReposController < ApplicationController
  def index
    @github_repos = Repositories.new(session[:github_user], session[:token], '/repos')
    @user_info = UserInfo.new(session[:github_user], session[:token])
  end
end
