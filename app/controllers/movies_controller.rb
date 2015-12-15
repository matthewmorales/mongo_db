class MoviesController < ApplicationController
	def index
		client = Mongo::Client.new([ '127.0.0.1:27017', '127.0.0.1:27018' ], :database => 'hollywood', :connect => :direct)
		@results = client[:movies].find()
		#Rails.logger.debug(results)
	end

	def show
		client = Mongo::Client.new([ '127.0.0.1:27017', '127.0.0.1:27018' ], :database => 'hollywood', :connect => :direct)
		#results = client[:movies].find()
		movie = URI.decode(params[:movie])
		result = client[:movies].find(:movie => movie).delete_one		
	end

	def destroy
		client = Mongo::Client.new([ '127.0.0.1:27017', '127.0.0.1:27018' ], :database => 'hollywood', :connect => :direct)
		#results = client[:movies].find()
		movie = URI.decode(params[:movie])
		Rails.logger.debug("DESTROY")
		result = client[:movies].find(:movie => movie).delete_one
		redirect_to action: "index"
	end
end
