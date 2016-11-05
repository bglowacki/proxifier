require "proxifier/version"
require 'proxifier/in_cloak/downloader'
require 'proxifier/in_cloak/parser'
require 'proxifier/free_proxy_list/parser'
require 'proxifier/free_proxy_list/downloader'
require 'proxifier/conf_generator'
require 'proxifier/conf_saver'

module Proxifier
  class Runner
    def initialize(proxy_source = "InCloak")
      if proxy_source == "InCloak"
        @downloader = InCloak::Downloader.new
        @parser = InCloak::Parser.new
      else
        @downloader = FreeProxyList::Downloader.new
        @parser = FreeProxyList::Parser.new
      end
      @conf_saver = ConfSaver.new
    end

    def call
      page = @downloader.call
      proxies = @parser.call(page).map(&:to_s)
      configuration = ConfGenerator.new(proxies).render
      @conf_saver.save(configuration)
    end
  end
end
