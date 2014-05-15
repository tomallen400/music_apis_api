class MusicbrainzClass
	
	def self.product_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.release(id: id, inc: { recordings: true, artists: true }) rescue nil
	end
	
	def self.products_search_by_title(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.releases(release: term, offset: page_to_25_offset(page).to_s, inc: { recordings: true, artists: true }) rescue nil
	end
	
	def self.recording_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.recording(id: id, inc: { isrcs: true, artist_rels: true, artists: true, work_rels: true, releases: true }) rescue nil
	end
	
	def self.recordings_search_by_title(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.recordings(recording: term, offset: page_to_25_offset(page).to_s, inc: { isrcs: true, artist_rels: true, artists: true, work_rels: true, releases: true }) rescue nil
	end
	
	def self.artist_by_id(id)
		wrapper = Musicbrainz::Wrapper.new(username: '')
  	wrapper.artist(id: id, inc: { aliases: true }) rescue nil
	end
	
	def self.artists_search_by_name(term, page)
		wrapper = Musicbrainz::Wrapper.new(username: '')
		wrapper.artists(name: term, offset: page_to_25_offset(page).to_s, inc: { aliases: true }) rescue nil
	end
	
	# General
	def self.page_to_25_offset(page)
  	if !page.blank?
  		(page - 1) * 25
  	else
  		0
  	end
  end
	
end