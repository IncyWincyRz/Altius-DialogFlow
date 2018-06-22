class Ad1 < ApplicationRecord
	def self.push(comment)
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
		line = comment
		request.body = "{\r\n\"lang\":\t\"en\",\r\n\"query\":\t\"#{line}\",\r\n\"sessionId\":\t\"644efa4b-0eb8-e326-3a1f-1274902d51b6\"\r\n}"
		response = http.request(request)
		data = JSON.parse(response.read_body)
		result = data["result"]["fulfillment"]["speech"]
		puts result
		@a = Ad1.new(review:line, response:result)
		@a.save
		@sel = Tmpl.where( intent: @a.response.downcase).pluck(:Gtemp)
		puts @sel 
		@bel = Tmpl.where( intent: @a.response.downcase).pluck(:Ptemp)
		puts @bel
		return {primary: @sel,secondary: @bel}
	end
end
