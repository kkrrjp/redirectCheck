# encoding: utf-8
require File.expand_path('../../spec_helper', __FILE__)

describe RedirectCheck::Check do
  before do
    @keys = RedirectCheck::Configuration::VALID_OPTION_KEYS
	end

	context 'with defalut' do
		before do
			RedirectCheck.configure do |config|
				@keys.each do |key|
		          config.send("#{key}=", key)
		        end
			end
		end
		
		after do
			RedirectCheck.init
		end
		
		it "should inherit module configuration" do
			check = RedirectCheck::Check.new
			@keys.each do |key|
				check.send(key).should == key
			end
		end
		
		context "with class configuration" do
			before do
		        @configuration = {
					:ua => 'Mozilla/5.0 (Linux; U; Android 4.0.3; ja-jp; ISW13F Build/V51R37G) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.',
					:file => File.expand_path( './files/redirect_other_site_4android.txt' ),
					:rows => [["http://pc.animelo.jp/","http://music.animelo.jp/","302"]],
					:result => [{:req_url=>"http://pc.animelo.jp/", :code=>302, :location=>"http://music.animelo.jp/", :result=>true}]
		        }
	      	end
	      	
	      	context "initialization" do
	      		it "should override module configuration" do
					check = RedirectCheck::Check.new(@configuration)
					@keys.each do |key|
						check.send(key).should == @configuration[key]
					end
				end

	      	end
		end
	end
end