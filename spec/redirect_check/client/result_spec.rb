# encoding: utf-8
require File.expand_path('../../../spec_helper', __FILE__)
describe RedirectCheck::Client do
	context '#Result' do
		before do
			@client = RedirectCheck::Client.new({
							:ua=> 'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0_1 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Mobile/9A405 Safari/7534.48.3', 
							:file=> File.expand_path('../../../../sample/files/test.txt',__FILE__),
              :rows=>[],
              :result=>[]
							})
		end
		
		describe '.set_result' do	
			context '#正しい設定' do
				before do
					@res = @client.header
				end
				
				it 'should set curent rows[1]' do
					@res[0][:location].should == @client.rows[0][1]
				end
				
				it 'should set curent result' do
					@res[0][:result].should == true
				end
			end
			
			context '#間違った設定' do
				before do
					@res = @client.header
				end
				
				it 'should set curent rows[1]' do
					@res[1][:location].should be_nil
				end
				
				it 'should set curent result' do
					@res[1][:result].should == false
				end
			end
		end
		
		describe '.get_result' do
			before do
				@res = @client.header
			end
			
			it 'should get result' do
				@client.send("get_result").should == @res
			end
		end
	end

end