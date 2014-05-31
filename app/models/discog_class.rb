class DiscogClass
	require 'discogs'
	require "net/https"
	require "uri"
	
	def self.product_by_id(id)
		#wrapper = Discogs::Wrapper.new("Metable at the British Library")
  	#wrapper.get_release(id) rescue nil
  	#HTTParty.get(ENV["DISCOGS"] + "releases/#{id}")
  	send_request(ENV["DISCOGS"] + "releases/#{id}")
	end
	
	def self.products_search_by_title(term, page)
		#wrapper = Discogs::Wrapper.new("Metable at the British Library")
		#wrapper.search(term, :type => "release", :page => page) rescue nil
		send_request(ENV["DISCOGS"] + "database/search?type=release&title=#{term}")
	end
	
	def self.products_search_by_params(params, page)
		#wrapper = Discogs::Wrapper.new("Metable at the British Library")
		#wrapper.search(term, :type => "release", :page => page) rescue nil
		result = send_request(ENV["DISCOGS"] + "database/search?type=release#{product_params(params, page)}")
		result = JSON.parse(result)
		if result && result["results"]
			result["results"]
		else
			[]
		end
	end
	
	def self.product_params(params, page)
		string = ""
		string += "&release_title=#{params[:title]}" if params[:title]
		string += "&artist=#{params[:artist]}" if params[:artist]
		string += "&catno=#{params[:catno]}" if params[:catno]
		string += "&barcode=#{params[:barcode]}" if params[:barcode]
		string += "&label=#{params[:label]}" if params[:label]
		string += "&format=#{params[:format]}" if params[:format]
		string += "&page=#{value_or_default(page, 1)}"
		string
	end
	
	def self.master_by_id(id)
		send_request(ENV["DISCOGS"] + "masters/#{id}")
	end
	
	def self.masters_search_by_params(params, page)
		result = send_request(ENV["DISCOGS"] + "database/search?type=master#{product_params(params, page)}")
		result = JSON.parse(result)
		if result && result["results"]
			result["results"]
		else
			[]
		end
	end
	
	def self.track_by_product_id(id, index)
		release = product_by_id(id)
  	release.tracklist[value_or_default(index, 0).to_i] if release
	end
	
	def self.artist_by_id(id)
		send_request(ENV["DISCOGS"] + "artist/#{id}")
	end
	
	def self.artists_search_by_name(term, page)
		#wrapper = Discogs::Wrapper.new("Metable at the British Library")
		#wrapper.search(term, :type => "artist", :page => page) rescue nil
		result = send_request(ENV["DISCOGS"] + "database/search?type=artist#{product_params({title: term}, page)}")
		result = JSON.parse(result)
		if result && result["results"]
			result["results"]
		else
			[]
		end
	end
	
	# General
	def self.value_or_default(value, default)
		if !value.blank?
			value
		else
			default
		end
	end
	
	def self.send_request(url)
		uri = URI.parse(URI.encode(url))
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		http.request(request).body
	end
	
end