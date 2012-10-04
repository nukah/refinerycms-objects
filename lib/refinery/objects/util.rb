require 'net/http'
require 'nokogiri'

module Refinery
	module Objects
		class Util
			def self.provide_position address
  				uri = URI.parse("http://geocode-maps.yandex.ru/1.x/")
		  		params = { :geocode => address.to_s, :results => 1, :rspn => 1, :ll => "37.618027,55.750707", :spn => "1.0,1.0", :sco => 'latlong' }
		  		uri.query = URI.encode_www_form(params)
		  		response = Net::HTTP.get_response(uri)
		  		if response.code == '200'
		  			xml = Nokogiri::XML(response.body)
		  			position = xml.xpath('//provider:pos', 'provider' => 'http://www.opengis.net/gml').text
		  		end
		  		position.gsub(" ",",")
			end
		end
	end
end