# encoding: utf-8

module Senha::Base
	
	# A class for handling the generation of a password based on options
	#
	# @author Jacob Hammack <jacob.hammack@hammackj.com>
	class Generator
		attr_accessor :available_chars
		
		# Creates a new instance of the Generator class 
		#
		# @return [Generator] 
		def initialize(options)
			@available_chars = Array.new
			
			@numbers = ('0'..'9').to_a
			@lower_case = ('a'..'z').to_a
			@upper_case = ('A'..'Z').to_a
			@punctuation = %w(. , ! : ;).to_a
			@symbols = %w(! @ # $ % ^ & * - =).to_a
			
			if options[:all]
				@available_chars.concat @numbers 
				@available_chars.concat @lower_case 
				@available_chars.concat @upper_case 
				@available_chars.concat @symbols 
				@available_chars.concat @punctuation
			else				
				if options[:numbers]
					@available_chars.concat @numbers
				end
			
				if options[:lowercase]
					@available_chars.concat @lower_case
				end
			
				if options[:uppercase]
					@available_chars.concat @upper_case
				end
				
				if options[:symbols]
					@available_chars.concat @symbols
				end
			
				if options[:punct]
					@available_chars.concat @punctuation
				end
			end
		end
		
		# Generates a password 
		#
		# @return [String] of the randomly generated password
		def password(length = 10)						
			1.upto(length).collect do |a|
				@available_chars[rand(@available_chars.size)]
			end.join
		end	
	end
end
