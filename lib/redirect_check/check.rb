# encoding: utf-8
require 'csv'
require File.expand_path('../request', __FILE__)
module RedirectCheck
	class Check
		attr_accessor *Configuration::VALID_OPTION_KEYS
		
		def initialize(options={})
      options = RedirectCheck.options.merge(options)
      Configuration::VALID_OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end

      read_file
    end
	    
    private
    def read_file
    	rows = []
    	begin
      	CSV.foreach(file, {:col_sep=>"\t"}) do |row|
      		rows << row
      	end
				
      	Configuration::VALID_OPTION_KEYS.each do |key|
      		send("#{key}=", rows) if key === :rows
      	end
      rescue
      	# error
      end
    end
	    
    include Request
	end
end