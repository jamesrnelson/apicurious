class GitHubFollowing

def initialize(screen_name, token)
  @screen_name = screen_name
  @token = token
end

def connection(path)
  conn = Faraday.new(url: "https://api.github.com/users/#{@screen_name}#{path}")
  response = conn.get do |req|
    req.headers['Authorization'] = @token
  end
  raw_search = JSON.parse(response.body, symbolize_names: true)
end
