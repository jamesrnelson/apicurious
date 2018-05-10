class StarredController < ApplicationController
  def index
    @github_starred = Repositories.new(current_user.screen_name, session[:token], '/starred')
  end
end
