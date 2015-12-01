# Copyright (c) 2010-2016 Arxopia LLC.
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

class ApplicationTest < Test::Unit::TestCase

	def setup
		@app = Senha::CLI::Application.new
	end

	def test_invalid
		out = capture_stdout do
			@app.run(["-QQ"])
		end

		assert out.string.length == 915, "GOT #{out.string.length}"
	end

	def test_missing
		out = capture_stdout do
			@app.run(["--length"])
		end

		assert out.string.length == 915, "GOT #{out.string.length}"
	end

	def test_nil
		out = capture_stdout do
			@app.run([])
		end

		assert out.string.length == 916, "GOT #{out.string.length}"
	end

	def test_n
		out = capture_stdout do
			@app.run(["-n"])
		end

		assert_match /[0-9]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_p
		out = capture_stdout do
			@app.run(["-p"])
		end

		assert_match /[!\.,:]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_s
		out = capture_stdout do
			@app.run(["-s"])
		end

		assert_match /[~!@#\$%\^\&\*\(\)_]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_l
		out = capture_stdout do
			@app.run(["-l"])
		end

		assert_match /[a-z]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_u
		out = capture_stdout do
			@app.run(["-u"])
		end

		assert_match /[A-Z]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_a
		out = capture_stdout do
			@app.run(["-a"])
		end

		assert_match /[a-zA-Z0-9!~@#\$%\^\&\*\(\)\.,:_]{#{Senha::DEFAULT_LENGTH}}/, out.string
	end

	def test_count
		out = capture_stdout do
			@app.run(["--count", "20", "-n"])
		end

		assert out.string.length == 220, "GOT #{out.string.length}"
	end

	def test_length
		out = capture_stdout do
			@app.run(["--length", "20", "-n"])
		end

		assert out.string.length == 21, "GOT #{out.string.length}"
	end

	def test_version
		out = capture_stdout do
			@app.run(["-v"])
		end

		assert out.string.length == 15, "GOT #{out.string.length}"
	end

	def test_help
		out = capture_stdout do
			@app.run(["-h"])
		end

		assert out.string.length == 916, "GOT #{out.string.length}"
	end
end
