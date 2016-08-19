module DesignerNews
  module StoryFormatter
    TWEET_LENGTH = 140
    SHORT_URL_HTTPS_LENGTH = 23
    WHITESPACE_LENGTH = 3

    def tweet
      [body, hashtag, mentions, url].compact.join(' ')
    end

    def body
      title.strip.truncate(max_length)
    end

    def max_length
      lengths = [TWEET_LENGTH, SHORT_URL_HTTPS_LENGTH, WHITESPACE_LENGTH]
      lengths.push(hashtag.length) if hashtag
      lengths.push(mentions.length) if mentions
      lengths.inject(:-)
    end

    def hashtag
      if badge
        badge.sub('_', '').prepend('#')
      end
    end

    def mentions
      if twitter_handles.any?
        handles = twitter_handles.map { |word| "@#{word}" }.join(' ')
        "(cc #{handles})"
      end
    end

    def url
      "https://www.designernews.co/stories/#{id}-#{title.downcase.gsub(/[^a-z0-9 ]/i, '').gsub(' ', '-')}?utm_source=twitter&utm_medium=social&utm_campaign=designernewsbot"
    end
  end
end
