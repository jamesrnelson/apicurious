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
    starred_connection.count
  end

  def starred_connection
    connection = Faraday.new(url: "https://api.github.com/users/#{@screen_name}/starred")
    response = connection.get do |req|
      req.headers['Authorization'] = @token
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
