case ENV['RAILS_ENV']
  when "development"
    ENV["DECIBEL_APP_ID"] = "fb8f43a3"
    ENV["DECIBEL_API_KEY"] = "ac024e2efefdff10eaeee3995af8eb52"
    ENV["DD_NO"] = "1"
    ENV["DISCOGS"] = "http://api.discogs.com/"
  when "test"
    ENV["DECIBEL_APP_ID"] = "fb8f43a3"
    ENV["DECIBEL_API_KEY"] = "ac024e2efefdff10eaeee3995af8eb52"
    ENV["DD_NO"] = "12345"
    ENV["DISCOGS"] = "http://api.discogs.com/"
  when "production"  
    ENV["DECIBEL_APP_ID"] = "fb8f43a3"
    ENV["DECIBEL_API_KEY"] = "ac024e2efefdff10eaeee3995af8eb52"
    ENV["DD_NO"] = "1"
    ENV["DISCOGS"] = "http://api.discogs.com/"
end
# Decibel::Wrapper.new(:decibel_app_id => "fb8f43a3", :decibel_app_key => "ac024e2efefdff10eaeee3995af8eb52")