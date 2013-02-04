# encoding: utf-8

module RedirectCheck
	class Client
		module Execution
			# リダイレクトのテストデータを使って
			# httpリクエストを行い、リダイレクトの結果を返す
			#
			def header
				res = []
				rows.each do |row|
					set_result( get_header(row[0]) , row )
				end

				get_result
			end
		end
	end
end