class UserExperienceReference < ActiveRecord::Base
  include CommonExperienceEnumerations

  add_enums :expertise

end
