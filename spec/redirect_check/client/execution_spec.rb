# encoding: utf-8
require File.expand_path('../../../spec_helper', __FILE__)
describe RedirectCheck::Client do
	before do
		@client = RedirectCheck::Client.new({
							:ua=> 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A405 Safari/7534.48.3', 
							:file=> File.expand_path('../../../../sample/files/test.txt',__FILE__),
              :rows=>[],
              :result=>[]
							})
	end
	
	describe '.header' do
		context "#正しい設定" do
			it "should class rows[0]" do
				@client.send("header")[0][:code].should == 302
				@client.send("header")[0][:location].should == @client.rows[0][1]
			end
		end
		
		context "#間違った設定" do
			it "should class rows[1]" do
				@client.send("header")[1][:code].should_not == 302
				@client.send("header")[1][:location].should_not == @client.rows[1][1]
			end
		end
	end
end