require 'proxifier/proxy'

module Proxifier
  module FreeProxyList
    class Parser
      def call(page)
        rows = page.search("table#proxylisttable").search("tr")
        rows = get_https_proxies(rows)
        get_elite_proxies(rows).map do |row|
          cells = row.search("td")
          if cells.count > 0
            ip = cells[0].text
            port = cells[1].text
            type = "HTTP"
            Proxy.new(type, ip, port).to_s
          end
        end.compact
      end

      def get_https_proxies(rows)
        rows.select do |row|
          cells = row.search("td")
          if cells.length > 0
            cells[6].text == "yes"
          else
            false
          end
        end
      end

      def get_elite_proxies(rows)
        rows.select do |row|
          cells = row.search("td")
          if cells.length > 0
            cells[4].text == "elite proxy"
          else
            false
          end
        end
      end
    end
  end
end
