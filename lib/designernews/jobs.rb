module DesignerNews
  class Jobs
    include HTTParty

    base_uri 'http://www.designernews.co/api/v2'
    default_params :client_id => ENV['DESIGNER_NEWS_CLIENT_ID'], :limit => 25
    format :json

    def self.recent
      jobs = get('/jobs', :jobs)
      jobs.map { |job| Job.new(job) }
    end

    private

    def self.get(path, key)
      super(path).parsed_response.fetch(key.to_s)
    end
  end
end
