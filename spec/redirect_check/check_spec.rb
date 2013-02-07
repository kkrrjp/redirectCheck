# encoding: utf-8
require File.expand_path('../../spec_helper', __FILE__)

describe RedirectCheck::Check do
	before do
		@keys = RedirectCheck::Configuration::VALID_OPTION_KEYS
	end

	context 'デフォルトの場合' do
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
	end

	context "#指定の場合" do
		before do
			@configuration = {
				:ua => 'Mozilla/5.0 (Linux; U; Android 4.0.3; ja-jp; ISW13F Build/V51R37G) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.',
				:file => File.expand_path( './sample/files/test.txt' ),
				:rows => [["http://www.yahoo.co.jp/","http://m.yahoo.co.jp/","302"],["http://animita.tv","http://animita.tv/top","302"]],
				:result => [{:req_url=>"http://www.yahoo.co.jp/", :code=>302, :location=>"http://m.yahoo.co.jp/", :result=>true}]
			}
		end
		after do
			RedirectCheck.init
		end
		
		context "#指定時での初期化の場合" do
			it "should override module configuration" do
				check = RedirectCheck::Check.new(@configuration)
				@keys.each do |key|
					check.send(key).should == @configuration[key]
				end
			end
		end
		
		context "#指定時でのファイル読み込み(private_method :read_file)" do
			it "should override module configuration rows" do
				check = RedirectCheck::Check.new(@configuration)
				check.send(:read_file)
				check.send(:rows).should == @configuration[:rows]
			end
		end
	end
end