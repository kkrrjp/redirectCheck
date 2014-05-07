# encoding: utf-8
#!/usr/bin/env ruby
require File.expand_path('../lib/redirect_check/error', __FILE__)
require File.expand_path('../lib/redirect_check/configuration', __FILE__)
require File.expand_path('../lib/redirect_check/check', __FILE__)
require File.expand_path('../lib/redirect_check/client', __FILE__)
module RedirectCheck
	extend Configuration

	def self.client(options={})
		RedirectCheck::Client.new(options)
	end
end

if $0 == __FILE__ then
    client = RedirectCheck::Client.new({
		:ua=> '',
		:file=> File.expand_path('../sample/check_url_list.txt',__FILE__),
		:rows=>[],
		:result=>[]
	})

	redirect_results = client.header
		redirect_results.each do |rr|
		p "request_url: #{rr[:req_url]}"
		p "result_code: #{rr[:code]}"
		p "result: #{rr[:result]}"
	end
end
