class DecibelClass
	
	def self.product_by_id(id)
		wrapper = Decibel::Wrapper.new(decibel_app_id: ENV['DECIBEL_APP_ID'], decibel_app_key: ENV['DECIBEL_API_KEY'])
  	wrapper.album(id: id, depth: { genres: true, identifiers: true, recordings: true, participations: true, artistdetails: true } ) rescue nil
	end
	
	def self.products_search_by_title(term, page)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		wrapper.albums(:title => term, :pagenumber => set_page(page), :depth => {:identifiers => true, :recordings => true, :participations => true, :artistdetails => true}) rescue nil
	end
	
	def self.products_search_by_params(params, page)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		if params[:catno]
			[wrapper.album(id: params[:catno], idtype: "catalognumber", depth: { genres: true, identifiers: true, recordings: true, participations: true, artistdetails: true } )] rescue nil
		elsif params[:barcode]
			[wrapper.album(id: params[:barcode], idtype: "ean", depth: { genres: true, identifiers: true, recordings: true, participations: true, artistdetails: true } )] rescue nil
		else
			wrapper.albums(product_params(params, page)) rescue nil
		end
	end
	
	def self.product_params(params, page)
		value = {}
		value[:title] = params[:title] if params[:title]
		value[:artist] = params[:artist] if params[:artist]
		if params[:catno]
			value[:id] = params[:catno]
			value[:idtype] = "catalognumber"
		elsif params[:barcode]
			value[:id] = params[:barcode]
			value[:idtype] = "ean"
		end
		value[:pagenumber] = set_page(page)
		value[:depth] = {identifiers: true, recordings: true, participations: true, artistdetails: true}
		value
	end
	
	def self.track_by_id(id)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
  	wrapper.recording(:id => id, :depth => {:genres => true, :artistdetails => true, :participations => true, :works => true}) rescue nil
	end
	
	def self.tracks_search_by_title(term, page)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		wrapper.recordings(:title => term, :pagenumber => set_page(page), :depth => {:artistdetails => true, :participations => true, :works => true}) rescue nil
	end
	
	def self.tracks_search_by_params(params, page)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		wrapper.recordings(track_params(params, page)) rescue nil
	end
	
	def self.track_params(params, page)
		value = {}
		value[:title] = params[:title] if params[:title]
		value[:artist] = params[:artist] if params[:artist]
		value[:pagenumber] = set_page(page)
		value[:depth] = {artistdetails: true, participations: true, works: true}
		value
	end
	
	def self.participant_by_id(id)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
  	wrapper.participant(:id => id, :depth => {:identifiers => true, :dates => true}) rescue nil
	end
	
	def self.participants_search_by_name(term, page)
		
	end
	
	def self.artist_by_id(id)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		wrapper.artist(:id => id, :depth => { :dates => true, :identifiers => true, :members => true, :urls => true }) rescue nil
	end
	
	def self.artists_search_by_name(name, page)
		wrapper = Decibel::Wrapper.new(:decibel_app_id => ENV['DECIBEL_APP_ID'], :decibel_app_key => ENV['DECIBEL_API_KEY'])
		wrapper.artists(:name => name, :pagenumber => set_page(page), :depth => { :dates => true, :identifiers => true, :members => true, :urls => true }) rescue nil
	end
	
	# General
	def self.set_page(page)
		if page.blank?
			"1"
		else
			page.to_s
		end
	end
	
end