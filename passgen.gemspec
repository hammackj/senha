# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'passgen'

Gem::Specification.new do |s|
	s.name 									= "#{PassGen::APP_NAME}"
	s.version 							= PassGen::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "#{PassGen::APP_NAME}"
	s.description 					= "#{PassGen::APP_NAME} is a password generation tool"
	s.license								= "BSD"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['passgen.gemspec']
	s.default_executable 		= 'passgen'
	s.executables 					= ['passgen']
	s.require_paths 				= ["lib"]
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.md", "LICENSE", "NEWS.md", "TODO.md"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = "nessusdb"
	
	s.add_development_dependency("rspec", ">= 2.4.0")
	s.add_development_dependency("rcov", ">= 0.9.9")
	s.add_development_dependency("yard", ">= 0.6.4")
	
end
