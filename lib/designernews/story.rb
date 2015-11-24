module DesignerNews
  class Story
    include StoryFormatter

    attr_reader :id, :title, :badge

    def initialize(hash)
      %w(id title badge created_at).each do |key|
        instance_variable_set("@#{key}", hash.fetch(key))
      end
    end

    def posted_in_last_ten?
      # Was the story posted in the last 10 minutes (our scheduled interval time)?
      created_at = DateTime.parse(@created_at).new_offset('-7').to_time
      created_at > Time.now - (10 * 60)
    end
  end
end
