class Ad1 < ApplicationRecord
	def self.push
		require 'json'
		require 'uri'
		require 'net/http'

		url = URI("https://api.api.ai/v1/query?v=20150910")

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		#http.verify_mode = OpenSSL::SSL::VERIFY_NONE

		request = Net::HTTP::Post.new(url)
		request["content-type"] = 'application/json'
		request["authorization"] = 'Bearer ba39150ac1bc45b1a3a0fd7da0defb67'
		request["cache-control"] = 'no-cache'
		f = File.open("/home/incywincy/Desktop/Altius/temp/SampleOP1.txt", "r")
		g = File.open("/home/incywincy/Desktop/Altius/temp/SampleOP3.txt", "w")
		f.each_line do |line|
		  puts line
		request.body = "{\r\n\"lang\":\t\"en\",\r\n\"query\":\t\"#{line}\",\r\n\"sessionId\":\t\"644efa4b-0eb8-e326-3a1f-1274902d51b6\"\r\n}"
		response = http.request(request)
		#puts response.read_body
		data = JSON.parse(response.read_body)
		#session =  data["sessionId"]
		result = data["result"]["fulfillment"]["speech"]
		#byebug
		puts result
		g.puts(result)
		@a = Ad1.new(review:[line], response:[result])
		@a.save
		end
		f.close
		g.close
	end
end
