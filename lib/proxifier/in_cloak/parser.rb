require 'proxifier/proxy'

module Proxifier
  module InCloak
    class Parser
      def call(page)
        page.search("table.proxy__t").search("tr").map do |row|
          cells = row.search("td")
          if cells.count > 0
            ip = cells[0].text
            port = cells[1].text
            type = cells[4].text.split(",").map(&:strip)[0]
            Proxy.new(type, ip, port).to_s
          end
        end.compact
      end
    end
  end
end
