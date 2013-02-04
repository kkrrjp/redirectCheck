# encoding: utf-8
module RedirectCheck
	class Client < Check
		Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
		
		include RedirectCheck::Client::Result
		include RedirectCheck::Client::Execution
	end
end