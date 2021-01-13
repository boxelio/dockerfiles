#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

uri = URI.parse('http://192.168.8.31:8545')
header = { 'Content-Type': 'application/json' }
body = { 'jsonrpc': '2.0', 'method': 'eth_syncing', 'params': [], 'id': 1 }

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = body.to_json

response = http.request(request)
eth_syncing = JSON.parse(response.body)[:result]
if eth_syncing
  puts eth_syncing.inspect
  puts "Ethereum: #{eth_syncing[:current_block]} of #{eth_syncing[:highest_block]}"
else
  puts "Ethereum: Not syncing right now."
end

btc_block_count = `docker exec bitcoind-node bitcoin-cli getblockcount 2>&1`.chomp
btc_block_height = `wget -O - http://blockchain.info/q/getblockcount 2>/dev/null`.chomp
puts "Bitcoin: #{btc_block_count} of #{btc_block_height} blocks synchronized."
