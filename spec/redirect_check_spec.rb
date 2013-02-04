# encoding: utf-8
require File.expand_path('../spec_helper', __FILE__)
describe RedirectCheck do
	after do
		RedirectCheck.init
	end
  	
  	
  	describe 'client' do
  		it "RedirectCheck::Client ?" do
			RedirectCheck.client.should be_a RedirectCheck::Client
		end
  	
  	end
	
	describe ".configure" do

    RedirectCheck::Configuration::VALID_OPTION_KEYS.each do |key|

      it "should set the #{key}" do
        RedirectCheck.configure do |config|
          config.send("#{key}=", key)
          RedirectCheck.send(key).should == key
        end
      end
    end
  end
end