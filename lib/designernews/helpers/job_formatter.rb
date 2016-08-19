module DesignerNews
  module JobFormatter
    TWEET_LENGTH = 140
    SHORT_URL_HTTPS_LENGTH = 23
    WHITESPACE_LENGTH = 2

    def tweet
      [featured_emoji, truncated_title, '@', organization_name, 'in', location, '#job', remote_emoji, url].compact.join(' ')
    end

    def truncated_title
      tweet_location = (location =~ /remote|anywhere/i) ? nil : "in #{location}"
      base_tweet = [featured_emoji, title, '@', organization_name, tweet_location, '#job', remote_emoji, ' '].compact.join(' ')
      full_tweet_length = base_tweet.length + SHORT_URL_HTTPS_LENGTH

      if full_tweet_length > TWEET_LENGTH
        title.truncate(title.length - (full_tweet_length - TWEET_LENGTH))
      else
        title
      end
    end

    def featured_emoji
      featured == true ? '🌟' : nil
    end

    def remote_emoji
      remote_friendly == true ? '📡' : nil
    end
  end
end
