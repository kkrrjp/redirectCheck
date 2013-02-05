# encoding: utf-8
require File.expand_path('../ua', __FILE__)
module RedirectCheck
	module Configuration
		VALID_OPTION_KEYS = [
			:ua,
			:file,
			:rows,
			:result
		].freeze
		
		DEFAULT_UA = RedirectCheck::UA
		DEFAULT_FILE = ''
		DEFAULT_ROWS = []
		DEFAULT_RESULT = []
		attr_accessor *VALID_OPTION_KEYS
		
		def self.extended(base)
      base.init
    end 
	    
    def init
			self.ua = DEFAULT_UA
			self.file = DEFAULT_FILE
			self.rows = DEFAULT_ROWS
			self.result = DEFAULT_RESULT
		end
		
    def options
      VALID_OPTION_KEYS.inject({}) do |option,key|
        option.merge!(key => send(key))
      end
    end
	    
    def configure
      yield self
    end
	end
end