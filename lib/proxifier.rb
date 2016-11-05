require "proxifier/version"
require 'proxifier/downloader'
require 'proxifier/parser'
require 'proxifier/conf_generator'
require 'proxifier/conf_saver'

module Proxifier
 class Runner
   def initialize
     @downloader = Downloader.new
     @parser = Parser.new
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

runner = Proxifier::Runner.new
runner.call
