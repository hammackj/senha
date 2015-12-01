# Copyright (c) 2010-2016 Arxopia LLC.
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
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.

module Senha
	module CLI

		# The Application class is responsible for the
		class Application

			# Creates a new instance of the Application Class
			#
			# @return [Application] New instance
			def initialize
			end

			# Parses the command line arguments
			def parse_arguments (args)
				begin
					options = {}

					options[:length] = Senha::DEFAULT_LENGTH
					options[:count] = 1

					opts = OptionParser.new do |opt|
						opt.banner =	"#{APP_NAME} v#{VERSION}\nJacob Hammack\nhttp://www.hammackj.com\n\n"
						opt.banner << "Usage: #{APP_NAME} <options>"
						opt.separator('')
						opt.separator("Password Options")

						opt.on("-n", "--numbers", "Use digits [0-9] in the password generation") do |n|
							options[:numbers] = n
						end

						opt.on("-p", "--punctuation", "Use punctuation in the password generation") do |p|
							options[:punct] = p
						end

						opt.on("-s", "--symbols", "Use symbols in the password generation") do |s|
							options[:symbols] = s
						end

						opt.on("-l", "--lowercase", "Use lowercase [a-z] in the password generation") do |l|
							options[:lowercase] = l
						end

						opt.on("-u", "--uppercase", "Use uppercase [A-Z] in the password generation") do |u|
							options[:uppercase] = u
						end

						opt.on("-a", "--all-characters", "Use all available character sets for password generationA") do |a|
							options[:all] = a
						end

						opt.separator ''
						opt.separator 'Other Options'

						opt.on("--count COUNT", Integer, "Number of passwords to generate, default is 1") do |count|
							options[:count] = count#.to_i
						end

						opt.on("--length LENGTH", Integer, "Use uppercase in the password generation, default is 10") do |length|
							options[:length] = length#.to_i
						end

						opt.on_tail('-v', '--version', "Shows application version information") do
							puts "#{APP_NAME} - #{VERSION}"
							exit
						end

						opt.on_tail("-?", "--help", "Show this message") do
							puts opt.to_s + "\n"
							exit
						end
					end

					if args.length != 0
				    	opts.parse! args
				  	else
				    	puts opts.to_s + "\n"
					  	exit
					end

					options
				rescue OptionParser::MissingArgument => m
					puts opts.to_s + "\n"
					exit
				rescue OptionParser::InvalidOption => i
					puts opts.to_s + "\n"
					exit
				end
			end

			# Main body of the Application class
			def run(args)
				options = parse_arguments(args)

				if options != nil
					gen = Senha::Base::Generator.new(options)

					options[:count].times do
						puts gen.password(options[:length])
					end
				end
			end
		end
	end
end
