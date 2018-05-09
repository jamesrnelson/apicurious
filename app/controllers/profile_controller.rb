class ProfileController < ApplicationController
  def index
    @user_info = UserInfo.new(current_user.screen_name, session[:token])
  end
end
