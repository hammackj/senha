base = __FILE__
$:.unshift(File.join(File.dirname(base), '../lib'))

require 'senha'
require 'senha/cli'

module Senha
	module CLI
		describe Application do
			before(:each) do
				@app = Application.new
			end
			
			describe Application, ".run" do
				it "prints a random password to STDOUT" do

				end
			end
		
			describe Application, ".parse_arguments" do
			
			end
		end
	end
end