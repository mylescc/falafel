module CommonExperienceEnumerations
  extend ActiveSupport::Concern

  AVAILABLE_ENUMS = {
    years_experience: {
      '0-1' => 1, '2-5' => 2, '6-10' => 3, '10+' => 4
    },
    expertise: {
      'Novice' => 1,
      'Competent' => 2,
      'Proficient' => 3,
      'Expert' => 4
    },
    company: {
      'Global' => 1,
      'International' => 2,
      'UK' => 3,
      'Start-Up' => 4,
      'SME' => 5,
      'EMEA' => 6,
      'APLA' => 7,
      'FTSE50' => 8,
      'FTSE100' => 9,
      'FTSE250' => 10
    }
  }

  class_methods do
    def add_enums(*args)
      args.each do | enum_name |
        enum enum_name => AVAILABLE_ENUMS[enum_name]
      end
    end
  end
end
