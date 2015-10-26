class UserExperienceRole < ActiveRecord::Base
  belongs_to :user
  validates :user, :name, :primary_activity, :primary_activity, presence: true

  enum primary_activity: {'IT Transformation' => 1, 'E-Commerce' => 2}
  enum years_experience: {'0-1' => 1, '2-5' => 2, '6-10' => 3, '10+' => 4}
end
