class GitHubClient

  ACCESS_TOKEN = ENV['GIST_SECRET']

  def initialize
    @http_client = Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def create_gist(params)
    @http_client.create_gist(params)
  end

end
