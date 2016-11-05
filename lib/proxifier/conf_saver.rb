module Proxifier
  class ConfSaver
    def initialize(conf_path = File.join("/", "etc", "proxychains.conf"))
      @conf_path = conf_path
    end

    def save(content)
      File.open(@conf_path, "w+") do |f|
        f.write(content)
      end
    end
  end
end
