# encoding: utf-8

module PassGen::Base
	
	#
	#
	class Generator
		
		#
		#
		def initialize(args)
			:numbers => ("0".."9").to_a
			:lower_case => ("a".."z").to_a
			:upper_case => ("A".."Z").to_a
			:symbols => %w(! @ # $ ^ % & * ( )).to_a
		end
		
		#
		#
		def password(size = 10)
			
			available_chars = :numbers + :lower_case + :upper_case + :symbols
			
			1.upto(size).collect do |a|
				available_char[rand(available_chars.size)]
			end.join
		end
		
	end
	
end


#def random_password(size = 8)
#	chars = (('a'..'z').to_a + ('0'..'9').to_a) - %w(i o 0 1 l 0)
#	(1..size).collect{|a| chars[rand(chars.size)] }.join
#end
