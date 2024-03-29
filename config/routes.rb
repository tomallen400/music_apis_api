Otherapis::Application.routes.draw do
  
  # Decibel
  get '/decibel/product/:id', to: 'decibels#product'
  get '/decibel/products', to: 'decibels#products'
  get '/decibel/track/:id', to: 'decibels#track'
  get '/decibel/tracks', to: 'decibels#tracks'
  get '/decibel/participant/:id', to: 'decibels#participant'
  get '/decibel/participants', to: 'decibels#participants'
  get '/decibel/artist/:id', to: 'decibels#artist'
  get '/decibel/artists', to: 'decibels#artists'
  
  # Musicbrainz
  get '/musicbrainz/product/:id', to: 'musicbrainzs#product'
  get '/musicbrainz/products', to: 'musicbrainzs#products'
  get '/musicbrainz/release_group/:id', to: 'musicbrainzs#release_group'
  get '/musicbrainz/release_groups', to: 'musicbrainzs#release_groups'
  get '/musicbrainz/track/:id', to: 'musicbrainzs#track'
  get '/musicbrainz/tracks', to: 'musicbrainzs#tracks'
  get '/musicbrainz/artist/:id', to: 'musicbrainzs#artist'
  get '/musicbrainz/artists', to: 'musicbrainzs#artists'
  get '/musicbrainz/work/:id', to: 'musicbrainzs#work'
  get '/musicbrainz/works', to: 'musicbrainzs#works'
  get '/musicbrainz/cover_art/:id', to: 'musicbrainzs#cover_art'
  
  # Discogs
  get '/discogs/product/:id', to: 'discogs#product'
  get '/discogs/products', to: 'discogs#products'
  get '/discogs/master/:id', to: 'discogs#master'
  get '/discogs/masters', to: 'discogs#masters'
  get '/discogs/release_group/:id', to: 'discogs#master'
  get '/discogs/release_groups', to: 'discogs#masters'
  get '/discogs/track/:id', to: 'discogs#track'
  get '/discogs/tracks', to: 'discogs#tracks'
  get '/discogs/artist/:id', to: 'discogs#artist'
  get '/discogs/artists', to: 'discogs#artists'
  
end
