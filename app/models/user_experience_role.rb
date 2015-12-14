class UserExperienceRole < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper
  belongs_to :user
  #validates :user, :primary_activity, presence: true

  enum primary_activity: {
    'Architect' => 1,
    'Business Analyst' => 2,
    'Developer' => 3,
    'Development Manager' => 4,
    'Graduate' => 5,
    'Head of Architecture' => 6,
    'Head of Development' => 7,
    'Head of Operations' => 8,
    'Head of Service Delivery' => 9,
    'IT Consultant' => 10,
    'IT Director/CIO' => 11,
    'IT Operations Manager' => 12,
    'IT Support Analyst' => 13,
    'IT Trainer' => 14,
    'PMO Analyst' => 15,
    'PMO Manager' => 16,
    'Programme Manager/Director' => 17,
    'Project Manager' => 18,
    'Service Delivery Manager' => 19,
    'Service Desk Analyst' => 20,
    'Service Desk Manager' => 21,
    'Test Analyst' => 22,
    'Test Manager' => 23
  }

  enum secondary_activity: {
    'Enterprise Architect' => 1,
    'Infrastructure Architect' => 2,
    'Solution Architect' => 3,
    'Technical Architect' => 4,
    'Analytics & BI' => 5,
    'Applications / COTS' => 6,
    'Business Change' => 7,
    'CRM' => 8,
    'Data Analyst' => 9,
    'Data Warehousing' => 10,
    'Document Management' => 11,
    'E-Commerce/Digital' => 12,
    'ERP' => 13,
    'Mobile' => 14,
    'Systems Analyst' => 15,
    'Technical Business Analyst' => 16,
    'Websites' => 17,
    'Workflow Management' => 18,
    'Back End Developer' => 19,
    'Database Developer' => 20,
    'Front End Developer' => 21,
    'Full Stack Developer' => 22,
    'Senior Developer' => 23,
    'Technical Lead' => 24,
    'Web Designer' => 25,
    'Desktop Support Analyst' => 26,
    'Infrastructure Engineer' => 27,
    'Network Engineer' => 28,
    'Project Engineer' => 29,
    'Server Engineer' => 30,
    '2nd Line Support' => 31,
    '3rd Line Support' => 32,
    'Big Data' => 33,
    'Business Transformation' => 34,
    'End User Computing' => 35,
    'Infrastructure' => 36,
    'IT Transformation' => 37,
    'Shared Services' => 38,
    'Software Development' => 39,
    'Systems Integration' => 40,
    'Technical' => 41,
    'Video on Demand' => 42,
    'Change Manager' => 43,
    'Configuration Manager' => 44,
    'Customer Service Manager' => 45,
    'Release Manager' => 46,
    'Service Reporting Manager' => 47,
    'Service Transition' => 48
  }

  add_enums :years_experience, :company

  def self.secondary_activity_map
    {
      # architect
      1 => [1, 2, 3, 4],
      # business analyst
      2 => [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18],
      # Developer
      3 => [19, 20, 21, 22, 23, 24, 25],
      # IT Support Analyst
      13 => [26, 27, 28, 29, 30, 24, 31, 32],
      # Programme Manager
      17 => [5, 6, 33, 7, 8, 10, 12, 35, 13, 36, 37, 38, 39, 40],
      # Project Manager
      18 => [5, 6, 33, 7, 8, 10, 12, 35, 13, 36, 37, 14, 38, 39, 40, 41, 42, 17],
      # Service Delivery Manager
      19 => [43, 44, 45, 46, 47, 48]
    }
  end
end
