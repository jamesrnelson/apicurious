class UserInfo
  def initialize(screen_name, token)
    @screen_name = screen_name
    @token = token
  end

  def avatar
    service1.raw_search[:avatar_url]
  end

  def following
    service1.raw_search[:following]
  end

  def followers
    service1.raw_search[:followers]
  end

  def repos
    service1.raw_search[:public_repos]
  end

  def name
    service1.raw_search[:name]
  end

  def nickname
    service1.raw_search[:login]
  end

  def starred
    service2.raw_search.count
  end

  private
    attr_reader :screen_name, :token

    def service1
      @service1 ||= GithubConnectionService.new(screen_name, path = nil, token)
    end

    def service2
      @service2 ||= GithubConnectionService.new(screen_name, '/starred', token)
    end
end
