require 'mechanize'

module Proxifier
  class Agent
    def self.create
      Mechanize.new
    end
  end
end
