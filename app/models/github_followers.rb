class GithubFollowers
  def initialize(screen_name, token)
    @screen_name = screen_name
    @token = token
  end

  def connection
    conn = Faraday.new(url: "https://api.github.com/users/#{@screen_name}/followers")
  end

  def response
    connection.get do |req|
      req.headers['Authorization'] = @token
    end
  end

  def other_github_users
    raw_github_users = JSON.parse(response.body, symbolize_names: true)
    raw_github_users.map do |raw_github_user|
      OtherGithubUser.new(raw_github_user)
    end
  end
end
