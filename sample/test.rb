# encoding: utf-8
#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/redirect_check.rb'

device = {	:android=>'Mozilla/5.0 (Linux; U; Android 4.0.3; ja-jp; ISW13F Build/V51R37G) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',
			:basic=>'DoCoMo/2.0 P903i(c100;TB;W24H12)',
			:iphone=>'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A405 Safari/7534.48.3'
		}
		
obj = RedirectCheck.client({
							:ua=> device[:android], 
							:file=> File.expand_path( './files/redirect_other_site_4android.txt' )
							})

res = obj.header


obj = RedirectCheck.client({
							:ua=> device[:basic], 
							:file=> File.expand_path('./files/redirect_other_site_4basic.txt')
							})


res = obj.header

p obj.rows

p "Android"
p "Basic"
puts "----------------------------------------------------"
puts "#{res.length} tests, #{res.select{|r| r[:result]==true}.length} passes, #{res.select{|r| r[:result]==false}.length} fails"
puts "----------------------------------------------------"

exit
