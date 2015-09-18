module DesignerNews
  class Stories
    include HTTParty

    base_uri 'http://www.designernews.co/api/v2'
    default_params :client_id => ENV['DESIGNER_NEWS_CLIENT_ID'], :sort => '-created_at'
    format :json

    def self.recent
      stories = get('/stories', :stories)
      stories.map { |story| Story.new(story) }
    end

    private

    def self.get(path, key)
      super(path).parsed_response.fetch(key.to_s)
    end
  end
end
