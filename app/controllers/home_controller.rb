class HomeController < ApplicationController

	def index
		client = Mongo::Client.new([ '127.0.0.1:27017', '127.0.0.1:27018' ], :database => 'cities', :connect => :direct)
		results = client[:city_data].find(:state => "MA")
		results.each do |document|
			#Rails.logger.debug(document.to_json)
		end
		#Rails.logger.debug(results)
	end
end
