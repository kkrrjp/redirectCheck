# encoding: utf-8
#!/usr/bin/env ruby

require File.expand_path( '../../lib/redirect_check.rb',__FILE__ )

device = {	:android=>'Mozilla/5.0 (Linux; U; Android 4.0.3; ja-jp; ISW13F Build/V51R37G) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30',
			:basic=>'DoCoMo/2.0 P903i(c100;TB;W24H12)',
			:iphone=>'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A405 Safari/7534.48.3'
		}

obj = RedirectCheck.client({
							:ua=> device[:android], 
							:file=> File.expand_path( '../files/redirect_other_site_4android.txt',__FILE__ )
							})

res = obj.header

p "Android"
puts "----------------------------------------------------"
puts "#{res.length} tests, #{res.select{|r| r[:result]==true}.length} passes, #{res.select{|r| r[:result]==false}.length} fails"
puts "----------------------------------------------------"

obj2 = RedirectCheck.client({
							:ua=> device[:android], 
							:file=> File.expand_path( '../files/redirect_other_site_4android_apache.txt',__FILE__ ),
              :rows=>[],
              :result=>[]
							})

res2 = obj2.header

p "Android Apache"
puts "----------------------------------------------------"
puts "#{res2.length} tests, #{res2.select{|r| r[:result]==true}.length} passes, #{res2.select{|r| r[:result]==false}.length} fails"
puts "----------------------------------------------------"

obj3 = RedirectCheck.client({
							:ua=> device[:basic], 
							:file=> File.expand_path('../files/redirect_other_site_4basic.txt',__FILE__),
              :rows=>[],
              :result=>[]
							})


res3 = obj3.header
p "Basic"
puts "----------------------------------------------------"
puts "#{res3.length} tests, #{res3.select{|r| r[:result]==true}.length} passes, #{res3.select{|r| r[:result]==false}.length} fails"
puts "----------------------------------------------------"


obj4 = RedirectCheck.client({
							:ua=> device[:basic], 
							:file=> File.expand_path('../files/redirect_other_site_4basic_apache.txt',__FILE__),
              :rows=>[],
              :result=>[]
							})


res4 = obj4.header
p "Basic Apache"
puts "----------------------------------------------------"
puts "#{res4.length} tests, #{res4.select{|r| r[:result]==true}.length} passes, #{res4.select{|r| r[:result]==false}.length} fails"
puts "----------------------------------------------------"


exit
