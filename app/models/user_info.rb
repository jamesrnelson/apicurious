class UserInfo
  def initialize(screen_name, token)
    @screen_name = screen_name
    @token = token
  end

  def connection(path = nil)
    Faraday.new(url: "https://api.github.com/users/#{@screen_name}#{path}")
  end

  def response
    @response ||= connection.get do |req|
      req.headers['Authorization'] = @token
    end
  end

  def raw_search
    JSON.parse(response.body, symbolize_names: true)
  end

  def avatar
    raw_search[:avatar_url]
  end

  def following
    raw_search[:following]
  end

  def followers
    raw_search[:followers]
  end

  def repos
    raw_search[:public_repos]
  end

  def name
    raw_search[:name]
  end

  def nickname
    raw_search[:login]
  end

  def starred
    connection('/starred')
    # response.count
  end



  # def following
  #   connection('/following')
  # end
  #
  # def followers
  #   connection('/followers')
  # end
  #
  # def starred_repos
  #   connection('/starred')
  # end
  #
  # def repos
  #   connection('/repos')
  # end
  #
  # def organizations
  #   connection('/orgs')
  # end
end
