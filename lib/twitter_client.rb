class TwitterClient
  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV.fetch('TWITTER_CONSUMER_KEY')
      config.consumer_secret     = ENV.fetch('TWITTER_CONSUMER_SECRET')
      config.access_token        = ENV.fetch('TWITTER_ACCESS_TOKEN')
      config.access_token_secret = ENV.fetch('TWITTER_ACCESS_TOKEN_SECRET')
    end
  end

  def tweet(str)
    @client.update(str)
  end

  def show_user_attributes(user_name)
    p @client.user(user_name).attrs
  end

  def show_user_tweets(user_name)
    @client.user_timeline(user_name).each do |timeline|
      tweet = @client.status(timeline.id)
      p tweet.attrs
    end
  end
end
