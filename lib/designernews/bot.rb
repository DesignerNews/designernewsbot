module DesignerNews
  class Bot
    def self.update
      Stories.recent.reverse.each do |story|
        Twitter.api.update(story.tweet) if story.posted_in_last_ten?
      end
    end
  end
end
