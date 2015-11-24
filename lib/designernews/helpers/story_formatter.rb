module DesignerNews
  module StoryFormatter
    TWEET_LENGTH = 140
    SHORT_URL_HTTPS_LENGTH = 23
    WHITESPACE_LENGTH = 2

    def tweet
      [body, hashtag, url].compact.join(' ')
    end

    def body
      title.strip.truncate(max_length)
    end

    def max_length
      lengths = [TWEET_LENGTH, SHORT_URL_HTTPS_LENGTH, WHITESPACE_LENGTH]
      lengths.push(hashtag.length) if hashtag
      lengths.inject(:-)
    end

    def hashtag
      if badge
        badge.sub('_', '').prepend('#')
      end
    end

    def url
      "https://www.designernews.co/stories/#{id}-#{title.downcase.gsub(/[^a-z0-9 ]/i, '').gsub(' ', '-')}?utm_source=twitter&utm_medium=social&utm_campaign=designernewsbot"
    end
  end
end
