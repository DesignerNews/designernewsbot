module DesignerNews
  class Job
    include JobFormatter

    attr_reader :organization_name, :title, :location, :url, :featured, :remote_friendly

    def initialize(hash)
      %w(organization_name title location url featured remote_friendly created_at).each do |key|
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
