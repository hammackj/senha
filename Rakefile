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

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require "senha"
require 'rake'
require 'rake/testtask'

task :build do
  system "gem build #{Senha::APP_NAME}.gemspec"
end

task :tag_and_bag do
	system "git tag -a v#{Senha::VERSION} -m 'version #{Senha::VERSION}'"
	system "git push --tags"
end

task :release => [:tag_and_bag, :build] do
  system "gem push #{Senha::APP_NAME}-#{Senha::VERSION}.gem"
	puts "Just released #{Senha::APP_NAME} v#{Senha::VERSION}. #{Senha::APP_NAME} is a simple CLI password generator. More information at http://hammackj.com/projects/senha/"
end

task :merge do
	system "git checkout master"
	system "get merge #{Senha::VERSION}"
	system "git push"
end

task :clean do
	system "rm *.gem"
end

Rake::TestTask.new("run_tests") do |t|
	t.libs << "test"
 	t.pattern = 'test/*/*_test.rb'
 	t.verbose = verbose
end

task :default => [:run_tests]
