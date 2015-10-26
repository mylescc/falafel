class UserExperienceIndustry < ActiveRecord::Base
  belongs_to :user
  validates :user, :industry, :primary_activity, :primary_activity, presence: true

  enum industry: {'Retail' => 1, 'Travel' => 2, 'Business Services' => 3, 'Banking' => 4, 'Media' => 5}
  enum primary_activity: {'Global' => 1, 'International' => 2}
  enum years_experience: {'0-1' => 1, '2-5' => 2, '6-10' => 3, '10+' => 4}
end
