# encoding: utf-8

require 'optparse'

module Senha
	module CLI
		
		# The Application class is responsible for the 
		#
		# @author Jacob Hammack <jacob.hammack@hammackj.com>
		class Application
	
			# Creates a new instance of the Application Class
			#
			# @return [Application] New instance
			def initialize
			end
	
			# Parses the command line arguments
			#
			def parse_arguments
				begin
					options = {}
								
					options[:length] = 10
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
								
					if ARGV.length != 0 
				    opts.parse!
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
			#
			def run
				options = parse_arguments
				
				gen = Senha::Base::Generator.new(options)
								
				options[:count].times do
					puts gen.password(options[:length])
				end				
			end
		end
	end
end
