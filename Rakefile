$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "senha"
 
task :build do
  system "gem build senha.gemspec"
end
 
task :release => :build do
  system "gem push senha-#{Senha::VERSION}.gem"
end

task :clean do
	system "rm *.gem"
end
