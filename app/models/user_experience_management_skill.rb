class UserExperienceManagementSkill < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper

  belongs_to :user
  #validates :user, :industry, :primary_activity, :primary_activity, presence: true

  enum primary_activity: {
    'Budget Management' => 1,
    'Outsourcing' => 2,
    'Stakeholder Engagement' => 3,
    'Team Size Managed' => 4,
    'Transformation & Change' => 5
  }

  enum secondary_activity: {
    '<£1m' => 1,
    '£1m-£10m' => 2,
    '£11m-£50m' => 3,
    '£51m-£100m' => 4,
    '<£100m' => 5,
    'Application / COTS providers' => 6,
    'Commercial' => 7,
    'Nearshoring' => 8,
    'Offshoring' => 9,
    'Procurement' => 10,
    'Projects' => 11,
    'Projects & Services' => 12,
    'Services' => 13,
    'Software Consultancy' => 14,
    'Software Development' => 15,
    'CxO/Board' => 16,
    'Business Function Heads' => 17,
    'Matrix Management' => 18,
    'Project Team' => 19,
    '3rd Party Management' => 20,
    '< 10' => 21,
    '11- 50' => 22,
    '51 - 99' => 23,
    '100-249' => 24,
    '>250' => 25,
    'IT Operating Model' => 26,
    'Mergers & Acquisitions' => 27,
    'Target Operating Model (TOM)' => 28
  }

  add_enums :years_experience

  def self.secondary_activity_map
    {
      #budget management
      1 => [1, 2, 3, 4, 5],
      #outsourcing
      2 => [6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
      #stakeholder engagement
      3 => [16, 17, 18, 19, 20],
      #team size managed
      4 => [21, 22, 23, 24, 25],
      #transformation and change
      5 => [26, 27, 28]
    }
  end
end
