class DiscogClass
	require 'discogs'
	
	def self.product_by_id(id)
		wrapper = Discogs::Wrapper.new("Metable at the British Library")
  	wrapper.get_release(id) rescue nil
	end
	
	def self.products_search_by_title(term, page)
		wrapper = Discogs::Wrapper.new("Metable at the British Library")
		wrapper.search(term, :type => "release", :page => page) rescue nil
	end
	
	def self.track_by_product_id(id, index)
		release = product_by_id(id)
  	release.tracklist[value_or_default(index, 0).to_i] if release
	end
	
	def self.artist_by_id(id)
		wrapper = Discogs::Wrapper.new("Metable at the British Library")
  	wrapper.get_artist(id) rescue nil
	end
	
	def self.artists_search_by_name(term, page)
		wrapper = Discogs::Wrapper.new("Metable at the British Library")
		wrapper.search(term, :type => "artist", :page => page) rescue nil
	end
	
	# General
	def self.value_or_default(value, default)
		if !value.blank?
			value
		else
			default
		end
	end
	
end