require "io/console"
require "octokit"
require "pstore"
require "prawntocat/issues"
require "prawntocat/pdf"
require "prawntocat/version"

module Prawntocat
  def self.authenticated?
    auth.has_key?('username') and auth.has_key?('token')
  end

  def self.authenticate!
    $stdout.print("GitHub username: ")
    username = $stdin.gets.chomp
    $stdout.print("GitHub password: ")
    password = $stdin.noecho(&:gets).chomp
    authorization = Octokit::Client.new(login: username, password: password).create_authorization(scopes: ["repo"], note: "Prawntocat Issue Printer", note_url: "http://nuclearsandwich.com/prawntocat")
    auth_store.transaction do
      auth_store['authorization'] ||= Hash.new
      auth_store['authorization']['username'] = username
      auth_store['authorization']['token'] = authorization.token
    end

  end

  def self.auth_store
    @auth_store ||= PStore.new(File.join(ENV['HOME'], ".prawntocat.pstore"))
  end

  def self.auth
    @auth ||= auth_store.transaction{ auth_store['authorization'] ||= Hash.new }
  end

  def self.client
    Octokit::Client.new login: auth['username'], oauth_token: auth['token']
  end
end

