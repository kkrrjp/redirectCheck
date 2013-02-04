# encoding: utf-8
#!/usr/bin/env ruby
require File.expand_path('../redirect_check/error', __FILE__)
require File.expand_path('../redirect_check/configuration', __FILE__)
require File.expand_path('../redirect_check/check', __FILE__)
require File.expand_path('../redirect_check/client', __FILE__)
module RedirectCheck
	extend Configuration

	def self.client(options={})
		RedirectCheck::Client.new(options)
	end
end


