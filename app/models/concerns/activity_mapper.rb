module ActivityMapper
  extend ActiveSupport::Concern

  included do
    def self.secondary_activities_for(primary_activity_id)
      secondary_ids = secondary_activity_map[primary_activity_id]
      secondary_ids.nil? ? [] : secondary_activities.select{ |k, v| secondary_ids.include?(v) }.keys
    end

    def self.mapped_secondary_activities
      mapped = {}
      primary_activities.each do |k, v|
        secondaries = secondary_activities_for(v)
        mapped[k] = secondaries unless secondaries.empty?
      end
      return mapped
    end

    def derived_primary_activity
      primary_activity.nil? ? other_primary_activity : primary_activity
    end

    def derived_secondary_activity
      secondary_activity.nil? ? other_secondary_activity : secondary_activity
    end
  end
end
