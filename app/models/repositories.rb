class Repositories
  def initialize(screen_name, token, path)
    @screen_name = screen_name
    @token = token
    @path = path
  end

  def user_repos
    raw_repos = service.raw_search
    raw_repos.map do |repo|
      Repo.new(repo)
    end
  end

  private
    attr_reader :screen_name, :path, :token

    def service
      @service ||= GithubConnectionService.new(screen_name, path, token)
    end
end
