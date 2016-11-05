require 'erb'

module Proxifier
  class ConfGenerator
    include ERB::Util

    def initialize(proxies, template="proxychains.conf.erb")
      @template_content = File.read(File.join(".." ,"templates", template))
      @proxies = proxies
    end

    def render
      ERB.new(@template_content).result(binding)
    end
  end
end
