$twitter_client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "umb6sBMfYw4VZgAL3DJjXlBvr"
	config.consumer_secret     = "h7PmIGYsfv68WwX9Y38CVPr4AeujVXdirlWVwMdyqN79TVpC1L"
	config.access_token        = "839458829410541568-ClMvzShxEDIxQWNiH19FodGeyrChOIu"
	config.access_token_secret = "fDwPe8AsKoIqjPGaa5Ea41lw5jUGDhKTTb1jpiJNjttDF"
end

$client = Twitter::Streaming::Client.new do |config|
	config.consumer_key        = "umb6sBMfYw4VZgAL3DJjXlBvr"
	config.consumer_secret     = "h7PmIGYsfv68WwX9Y38CVPr4AeujVXdirlWVwMdyqN79TVpC1L"
	config.access_token        = "839458829410541568-ClMvzShxEDIxQWNiH19FodGeyrChOIu"
	config.access_token_secret = "fDwPe8AsKoIqjPGaa5Ea41lw5jUGDhKTTb1jpiJNjttDF"
end