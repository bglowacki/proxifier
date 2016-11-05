module Proxifier
  class Proxy
    attr_reader :ip, :port

    def initialize(type, ip, port)
      @type = type
      @ip = ip
      @port = port
    end

    def type
      @type.downcase
    end

    def to_s
      "#{type}  #{@ip} #{@port}"
    end
  end
end
