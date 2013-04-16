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
    $stderr.puts("Unable to authenticate at this time.")
    exit 3
  end

  def self.auth
    @auth_store ||= PStore.new(File.join(ENV['HOME'], ".prawntocat.pstore"))
    @auth ||= @auth_store.transaction{ @auth_store['authorization'] ||= Hash.new }
  end

  def self.client
    Octokit::Client.new login: auth['username'], oauth_token: auth['token']
  end
end

