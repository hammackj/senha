$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "senha"
 
task :build do
  system "gem build #{Senha::APP_NAME}.gemspec"
end

task :release => :build do
  system "gem push #{Senha::APP_NAME}-#{Senha::VERSION}.gem"
	puts "Just released #{Senha::APP_NAME} v#{Senha::VERSION}. #{Senha::APP_NAME} is always available in RubyGems! More information at http://hammackj.com/projects/senha/"
end

task :clean do
	system "rm *.gem"
end
