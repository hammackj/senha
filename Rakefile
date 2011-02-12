$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "passgen"
 
task :build do
  system "gem build passgen.gemspec"
end
 
task :release => :build do
  system "gem push passgen-#{PassGen::VERSION}.gem"
end

task :clean do
	system "rm *.gem"
end
