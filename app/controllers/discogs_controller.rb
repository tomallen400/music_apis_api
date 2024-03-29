class DiscogsController < ApplicationController
	
	def product
		render :json => DiscogClass.product_by_id(params[:id])
	end
	
	def products
		render :json => DiscogClass.products_search_by_params(params, params[:page])
	end
	
	def master
		render :json => DiscogClass.master_by_id(params[:id])
	end
	
	def masters
		render :json => DiscogClass.masters_search_by_params(params, params[:page])
	end
	
	def track
		render :json => DiscogClass.track_by_product_id(params[:id], params[:index])
	end
	
	def artist
		render :json => DiscogClass.artist_by_id(params[:id])
	end
	
	def artists
		render :json => DiscogClass.artists_search_by_name(params[:name], params[:page])
	end
	
end