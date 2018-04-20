#! /usr/local/bin/ruby
require "ipaddr"
require "net/ping"

def calculate_network_range(ip,mask)
  address="#{ip}/#{mask}"
  ip_range=IPAddr.new(address).to_range.map {|ip_object| ip_object.to_s}
end

def scan_range(ip_range)
  active_ips = ip_range.select { |ip| NET::Ping::External.new(ip).ping?}
end

def write_to_file(active_ips)
  File.open("active_ips.txt"."w") do |file|
    active_ips.each do |ip_address|
      file.puts ip_address
    end
  end
end

range=calculate_network_range(ARGV[0],ARGV[1])
scan_range(range)
write_to_file(active_ips)
