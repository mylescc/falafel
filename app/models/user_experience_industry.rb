class UserExperienceIndustry < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper

  belongs_to :user
  #validates :user, :primary_activity, presence: true

  enum primary_activity: {
    'Accountancy' => 1,
    'Aerospace' => 2,
    'Banking' => 3,
    'Business Services' => 4,
    'Charity/Not for Profit' => 5,
    'Construction' => 6,
    'Defence' => 7,
    'Education' => 8,
    'FMCG' => 9,
    'Financial Services' => 10,
    'Healthcare' => 11,
    'Insurance' => 12,
    'Internet/Ecommerce' => 13,
    'IT' => 14,
    'Law' => 15,
    'Leisure' => 16,
    'Management Consultancy' => 17,
    'Manufacturing' => 18,
    'Media' => 19,
    'Pharmaceuticals' => 20,
    'Private Equity ' => 21,
    'Property' => 22,
    'Public Sector' => 23,
    'Retail' => 24,
    'Security' => 25,
    'Transport/Logistics' => 26,
    'Travel/Tourism' => 27,
    'Utilities' => 28
  }

  enum secondary_activity: {
    'Retail Banking' => 1,
    'Investment Banking' => 2,
    'Events' => 3,
    'Hospitality' => 4,
    'Advertising' => 5,
    'Entertainment' => 6,
    'Biotech' => 7,
    'Venture Capital ' => 8,
    'Hedge Fund' => 9,
    'Asset Management' => 10,
    'Housing' => 11,
    'Real Estate' => 12,
    '-Healthcare' => 13,
    'Central Government' => 14,
    'Local Government' => 15,
    'NGO' => 16,
    'NHS' => 17,
    'Police' => 18,
    'Fashion' => 19,
    'Gas' => 20,
    'Power' => 21,
    'Electricity' => 22,
    'Oil' => 23,
    'Mining' => 24,
    'Energy' => 25
  }

  add_enums :years_experience

  def self.secondary_activity_map
    {
      #banking
      3 => [1, 2],
      #leisure
      16 => [3, 4],
      #media
      19 => [5, 6],
      #pharmaceuticals
      20 => [7],
      #private equity
      21 => [8, 9, 10],
      #property
      22 => [11, 12],
      #public sector
      23 => [13, 14, 15, 16, 17, 18],
      #retail
      24 => [19],
      #utilities
      28 => [20, 21, 22, 23, 24, 25]
    }
  end
end
