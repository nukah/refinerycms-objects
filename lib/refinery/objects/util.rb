require 'net/http'
require 'nokogiri'

module Refinery
	module Objects
		class Util
			def self.provide_position address
  				uri = URI.parse("http://maps.googleapis.com/maps/api/geocode/json")
		  		params = { :address => address.to_s, :sensor => false, :language => 'ru' }
		  		uri.query = URI.encode_www_form(params)
		  		response = Net::HTTP.get_response(uri)
		  		if response.code == '200'
		  			json = JSON.parse(response.body)
		  			location = json['results'].first['geometry']['location'].values.join(',')
		  		end
		  		location
			end
		end
	end
end