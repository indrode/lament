require 'patron'
require 'json'

class Git

  attr_reader :git_user, :git_repo

  def initialize(user, repo)
    @git_user = user
    @git_repo = repo
    begin
      @session = Patron::Session.new
      @session.timeout = 10
      @session.base_url = "https://api.github.com/"
      @session.headers['User-Agent'] = 'myapp/1.0'
    rescue
      @session = false
    end
  end

  def all_commits
    response = @session.get("repos/#{git_user}/#{git_user}/commits")
    response.body
  end

  def self.get_latest_sha(commits_body)
    json = JSON.parse(commits_body, :symbolize_names => true)
    json.first.fetch(:sha)[0..9]
  end

  def self.frozen_sha
    sha = ""
    File.open("tmp/sha.txt", "r") do |file|
      sha = file.gets.to_s
    end
    sha
  end

end