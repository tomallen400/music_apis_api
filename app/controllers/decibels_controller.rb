class DecibelsController < ApplicationController
	
	def product
		render :json => DecibelClass.product_by_id(params[:id])
	end
	
	def products
		render :json => DecibelClass.products_search_by_params(params, params[:page])
	end
	
	def track
		render :json => DecibelClass.track_by_id(params[:id])
	end
	
	def tracks
		render :json => DecibelClass.tracks_search_by_params(params, params[:page])
	end
	
	def participant
	render :json => DecibelClass.participant_by_id(params[:id])
	end
	
	def participants
	
	end
	
	def artist
		render :json => DecibelClass.artist_by_id(params[:id])
	end
	
	def artists
		render :json => DecibelClass.artists_search_by_name(params[:name], params[:page])
	end
	
end