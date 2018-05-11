class StarredController < ApplicationController
  def index
    @github_starred = Repositories.new(session[:github_user], session[:token], '/starred')
    @user_info = UserInfo.new(session[:github_user], session[:token])
  end
end
