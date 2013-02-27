# Copyright (c) 2010-2013 Arxopia LLC.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Arxopia LLC nor the names of its contributors
#     	may be used to endorse or promote products derived from this software
#     	without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL ARXOPIA LLC BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
#OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
#OF THE POSSIBILITY OF SUCH DAMAGE.

module Senha
	module Base

		# A class for handling the generation of a password based on options
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
				@punctuation = %w(. , ! :).to_a
				@symbols = %w(~ ! @ # $ % ^ & * ( ) _).to_a

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
end
