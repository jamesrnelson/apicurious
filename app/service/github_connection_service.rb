class GithubConnectionService
  def initialize(screen_name, path, token)
    @screen_name = screen_name
    @path = path
    @token = token
  end

  def raw_search
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :screen_name, :path, :token

    def connection
      Faraday.new(url: "https://api.github.com/users/#{@screen_name}#{@path}")
    end

    def response
      connection.get do |req|
        req.headers['Authorization'] = @token
      end
    end
end
