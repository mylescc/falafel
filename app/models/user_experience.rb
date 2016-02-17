class UserExperience < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper
  belongs_to :user
end
