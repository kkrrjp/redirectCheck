# encoding: utf-8

module RedirectCheck
	class Client
		module Result
			# リダイレクトテストの結果をセット
			#    @param data HTTPResponse HTTPリクエストの結果
			#    @param req_data Array リクエストしたデータ
			#    @return void
			def set_result(data,req_data)
				res = {:req_url => req_data[0] , :code => data.code.to_i , :location => data['location'] , :result=>false}
				if req_data[2] == data.code
					if data['location'] == req_data[1]
						res[:result] = true
					end
				end
				
				result << res
				return
			end
			
			# リダイレクトテストの全結果を返す
			#    @return Array リダイレクトテストの結果
			#
			def get_result
				result
			end
		end
	end
end