class MusicbrainzClass
	
	def self.product_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.release(id: id, inc: { recordings: true, artists: true }) rescue nil
	end
	
	def self.products_search_by_title(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.releases(release: term, offset: page_to_25_offset(page), inc: { recordings: true, artists: true }) rescue nil
	end
	
	def self.products_search_by_params(params, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.releases(product_params(params, page)) rescue nil
	end
	
	def self.product_params(params, page)
		value = {}
		value[:release] = params[:title] if params[:title]
		value[:catno] = params[:catno] if params[:catno]
		value[:barcode] = params[:barcode] if params[:barcode]
		value[:artist] = params[:artist] if params[:artist]
		value[:offset] = page_to_25_offset(page)
		value[:inc] = { recordings: true, artists: true }
		value
	end
	
	def self.recording_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.recording(id: id, inc: { isrcs: true, artist_rels: true, artists: true, work_rels: true, releases: true }) rescue nil
	end
	
	def self.recordings_search_by_title(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.recordings(recording: term, offset: page_to_25_offset(page), inc: { isrcs: true, artist_rels: true, artists: true, work_rels: true, releases: true }) rescue nil
	end
	
	def self.recordings_search_by_params(params, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.recordings(recording_params(params, page)) rescue nil
	end
	
	def self.recording_params(params, page)
		value = {}
		value[:recording] = params[:title] if params[:title]
		value[:artist] = params[:artist] if params[:artist]
		value[:offset] = page_to_25_offset(page)
		value[:inc] = { isrcs: true, artist_rels: true, artists: true, work_rels: true, releases: true }
		value
	end
	
	def self.artist_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.artist(id: id, inc: { aliases: true }) rescue nil
	end
	
	def self.artists_search_by_name(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.artists(name: term, offset: page_to_25_offset(page), inc: { aliases: true }) rescue nil
	end
	
	def self.work_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.work(id: id, inc: { artist_rels: true }) rescue nil
	end
	
	def self.works_search_by_title(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.works(work: term, offset: page_to_25_offset(page), inc: { artist_rels: true })
	end
	
	def self.cover_art(musicbrainz_id)
		require 'open-uri'
  	wrapper = Musicbrainz::Wrapper.new(:username => '')
		wrapper.cover_art_archive_query(musicbrainz_id)
	end
	
	# General
	def self.page_to_25_offset(page)
  	if !page.blank?
  		(page.to_i - 1) * 25
  	else
  		0
  	end
  end
	
end