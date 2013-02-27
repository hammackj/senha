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

require 'test_helper'

class GeneratorTest < Test::Unit::TestCase

	def setup
		options = {}
		options[:lowercase] = true
		options[:length] = 10

		@gen = Senha::Base::Generator.new options
	end

	def test_26_chars
		#{}"should have 26 available characters" do
		assert @gen.available_chars.size == 26
	end

	def test_10_char_pass
	#	"should generate a 10 character password"
		assert @gen.password.size == 10
	end

	def test_a_z
	#	"should generate a password with only [a-z]"
		pass = @gen.password
		assert_match /[a-z]{#{pass.size}}/, pass
	end

	def test_0_9
		options = {}
		options[:numbers] = true
		options[:length] = 10

		10000.times do
			gen = Senha::Base::Generator.new options
			pass = gen.password

			assert_match /[0-9]{#{pass.size}}/, pass
		end
	end

	def test_A_Z
		options = {}
		options[:uppercase] = true
		options[:length] = 10

		10000.times do
			gen = Senha::Base::Generator.new options
			pass = gen.password

			assert_match /[A-Z]{#{pass.size}}/, pass
		end
	end

	def test_symbols
		options = {}
		options[:symbols] = true
		options[:length] = 10

		10000.times do
			gen = Senha::Base::Generator.new options
			pass = gen.password

			assert_match /[~!@#\$%\^\&\*\(\)_]{#{pass.size}}/, pass
		end
	end

	def test_punct
		options = {}
		options[:punct] = true
		options[:length] = 10

		10000.times do
			gen = Senha::Base::Generator.new options
			pass = gen.password

			assert_match /[!\.,:]{#{pass.size}}/, pass
		end
	end

	def test_all
		options = {}
		options[:all] = true
		options[:length] = 10

		10000.times do
			gen = Senha::Base::Generator.new options
			pass = gen.password

			assert_match /[a-zA-Z0-9!~@#\$%\^\&\*\(\)\.,:_]{#{pass.size}}/, pass
		end
	end
end
