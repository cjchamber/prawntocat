require "prawntocat"

module Prawntocat
  class Issues
    def initialize repo
      @repo = repo
    end

    def client
      @client ||= Prawntocat.client
    end

    def each
      client.list_issues
    end
  end
end
