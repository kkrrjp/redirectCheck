# encoding: utf-8
require 'net/http'

module RedirectCheck
	module Request
		# HTTPリクエストのヘッダーを取得
		#    @param string リクエストURL
		def get_header(req_url)
			request_header(req_url)
		end
		
		private
		
		def request_header(req_url)
			response = nil
			url = URI.parse(req_url)
			Net::HTTP.start(url.host, url.port) {|http| 
				if ua.nil?
					response = http.head(url.path) 
				else
					response = http.head(url.path,{'User-Agent' => ua}) 
				end
			}
			response
		end
	end
end