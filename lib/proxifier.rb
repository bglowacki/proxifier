require "proxifier/version"
require 'proxifier/in_cloak/downloader'
require 'proxifier/in_cloak/parser'
require 'proxifier/conf_generator'
require 'proxifier/conf_saver'

module Proxifier
 class Runner
   def initialize
     @downloader = InCloak::Downloader.new
     @parser = InCloak::Parser.new
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
