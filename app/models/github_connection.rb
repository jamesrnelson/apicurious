class GithubConnection

  def initialize(screen_name, path, token)
    @screen_name = screen_name
    @path = path
    @token = token
  end

  def connection
    Faraday.new(url: "https://api.github.com/users/#{@screen_name}#{@path}")
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

  def user_repos
    raw_github_repos = JSON.parse(response.body, symbolize_names: true)
    raw_github_repos.map do |raw_github_repo|
      Repo.new(raw_github_repo)
    end
  end
end
