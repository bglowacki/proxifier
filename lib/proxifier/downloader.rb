require 'proxifier/agent'

module Proxifier
  class Downloader
    def initialize
      @agent = Agent.create
    end

    def call(url="https://incloak.com/proxy-list/?maxtime=200#list")
      @agent.get(url)
    end
  end
end
