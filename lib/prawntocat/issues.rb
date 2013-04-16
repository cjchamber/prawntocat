require "ostruct"
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
      page = 1
      loop do
        issues = client.list_issues(@repo, page: page)
        break if issues.empty?
        page += 1
        issues.each { |hash| yield hash }
      end
    end
  end
end
