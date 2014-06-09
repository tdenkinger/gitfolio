require "json"
require "faraday"

module Adapters
  class Github
    attr_reader :user, :gh_conn

    def initialize user: user
      @user = user
      @gh_conn = create_connection
    end

    def names
      repos = JSON.parse make_call
      repos.each_with_object([]) do | repo, names |
        names << repo["name"]
      end
    end

    def details name: name
      JSON.parse make_call type: :detail, name: name
    end

    private

    def make_call type: type, name: name
      if type == :detail
        res = gh_conn.get("/repos/#{user}/#{name}")
      else
        res = gh_conn.get("/users/#{user}/repos")
      end
      res.body
    end

    def create_connection
      Faraday.new(:url => 'https://api.github.com') do | f |
        f.request  :url_encoded
        f.adapter  Faraday.default_adapter
      end
    end
  end
end
