# encoding: utf-8

base = __FILE__
$:.unshift(File.join(File.dirname(base), 'lib'))

require 'senha'

Gem::Specification.new do |s|
	s.name 									= "#{Senha::APP_NAME}"
	s.version 							= Senha::VERSION
	s.homepage 							= "http://www.hammackj.com/"
	s.summary 							= "#{Senha::APP_NAME}"
	s.description 					= "#{Senha::APP_NAME} is a password generation tool"
	s.license								= "BSD"
	
	s.author 								= "Jacob Hammack"
	s.email 								= "jacob.hammack@hammackj.com"
	
	s.files 								= Dir['[A-Z]*'] + Dir['lib/**/*'] + ['senha.gemspec']
	s.default_executable 		= '#{Senha::APP_NAME}'
	s.executables 					= ['#{Senha::APP_NAME}']
	s.require_paths 				= ["lib"]
	
	s.has_rdoc 							= 'yard'
	s.extra_rdoc_files 			= ["README.markdown", "LICENSE", "NEWS.markdown"]
	
	s.required_rubygems_version = ">= 1.3.6"
	s.rubyforge_project         = "#{Senha::APP_NAME}"
	
	s.add_development_dependency("rspec", ">= 2.4.0")
	s.add_development_dependency("rcov", ">= 0.9.9")
	s.add_development_dependency("yard", ">= 0.6.4")
	
end
