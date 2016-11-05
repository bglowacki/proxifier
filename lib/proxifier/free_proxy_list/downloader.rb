require 'proxifier/agent'

module Proxifier
  module FreeProxyList
    class Downloader
      def initialize
        @agent = Agent.create
      end

      def call(url="https://free-proxy-list.net/")
        @agent.get(url)
      end
    end
  end
end
