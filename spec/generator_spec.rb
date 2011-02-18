base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'senha'
require 'senha/cli'

module Senha
	module Base
		describe Generator do
			before(:each) do
				options = {}
				options[:lowercase] = true
				options[:length] = 10
				
				@gen = Generator.new options
			end
			
			describe Generator, ".new" do
				it "should have 26 available characters" do
					@gen.available_chars.size.should == 26
				end
			end
		
			describe Generator, ".password" do
				it "should generate a 10 character password" do
					pass = @gen.password					
					pass.size.should == 10					
				end
				
				it "should generate a password with only [a-z]" do
					pass = @gen.password
					pass.should match /[a-z]{#{pass.size}}/
				end
			end
		end
	end
end

