require "proxifier/version"
require 'proxifier/downloader'
require 'proxifier/parser'
require 'proxifier/conf_generator'

module Proxifier
 class Runner
   def initialize
     @downloader = Downloader.new
     @parser = Parser.new

   end

   def call
     page = @downloader.call
     proxies = @parser.call(page).map(&:to_s)
     puts @conf_generator = ConfGenerator.new(proxies).render
   end
 end
end

runner = Proxifier::Runner.new
runner.call
