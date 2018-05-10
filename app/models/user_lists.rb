class UserLists
  def initialize(screen_name, token, path)
    @screen_name = screen_name
    @token = token
    @path = path
  end

  def other_github_users
    raw_users = service.raw_search
    raw_users.map do |user|
      OtherGithubUser.new(user)
    end
  end

  private
    attr_reader :screen_name, :path, :token

    def service
      @service ||= GithubConnectionService.new(screen_name, path, token)
    end
end
