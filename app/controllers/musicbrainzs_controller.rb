class MusicbrainzsController < ApplicationController
	
	def product
		render :json => MusicbrainzClass.product_by_id(params[:id])
	end
	
	def products
		render :json => MusicbrainzClass.products_search_by_params(params, params[:page])
	end
	
	def track
		render :json => MusicbrainzClass.recording_by_id(params[:id])
	end
	
	def tracks
		render :json => MusicbrainzClass.recordings_search_by_params(params, params[:page])
	end
	
	def artist
		render :json => MusicbrainzClass.artist_by_id(params[:id])
	end
	
	def artists
		render :json => MusicbrainzClass.artists_search_by_name(params[:name], params[:page])
	end
	
	def work
		render :json => MusicbrainzClass.work_by_id(params[:id])
	end
	
	def works
		render :json => MusicbrainzClass.works_search_by_title(params[:title], params[:page])
	end
	
	def cover_art
		render :json => MusicbrainzClass.cover_art(params[:id])
	end
	
end