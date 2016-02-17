class UserExperienceMethod < UserExperience
  #validates :user, :primary_activity, presence: true
  add_enums :years_experience

  enum primary_activity: {
    'Agile' => 1,
    'Cisco' => 2,
    'COBIT' => 3,
    'Design' => 4,
    'DSDM' => 5,
    'FITS' => 6,
    'ISEB' => 7,
    'ITIL v2' => 8,
    'ITIL v3' => 9,
    'ITUP' => 10,
    'Lean' => 11,
    'Microsoft' => 12,
    'MOF' => 13,
    'MSP' => 14,
    'PMI' => 15,
    'PMP' => 16,
    'PRINCE2' => 17,
    'P3O' => 18,
    'Requirements Definition' => 19,
    'Regulatory Expertise' => 20,
    'SDLC' => 21,
    'Security' => 22,
    'Solvency II' => 23,
    'TOGAF' => 24,
    'VMWare' => 25,
    'Waterfall' => 26
  }

  enum secondary_activity: {
    'ScrumMaster' => 1,
    'PMI-ACP' => 2,
    'CCNA' => 3,
    'CCNP' => 4,
    'CCIE' => 5,
    'User Interface Design' => 6,
    'UML' => 7,
    'Foundation' => 8,
    'Practioner' => 9,
    'Higher Level' => 10,
    'Intermediate' => 11,
    '-Expert' => 12,
    'Master' => 13,
    'MCSA' => 14,
    'MCSE' => 15,
    'MCSD' => 16,
    'MS' => 17,
    'MCT' => 18,
    'MOS' => 19,
    'Professional' => 20,
    'Use Cases' => 21,
    'Wireframing' => 22,
    'Object Oriented Design' => 23,
    'OOAD' => 24,
    'User Stories' => 25,
    'OJEU' => 26,
    '-Solvency II' => 27,
    'Pillar 3' => 28,
    'VCP' => 29
  }

  def self.secondary_activity_map
    {
      #agile
      1 => [1,2],
      #cisco
      2 => [3, 4, 5],
      #design
      4 => [6, 7],
      #iseb
      7 => [8, 9, 10],
      #itil v3
      9 => [8, 11, 12, 13],
      #microsoft
      12 => [14, 15, 16, 17, 18, 19],
      #prince2
      17 => [8, 9, 20],
      #requirements definition
      19 => [7, 21, 22, 23, 24, 25],
      #regulatory expertise
      20 => [26, 27],
      #solvency ii
      23 => [28],
      #vmware
      25 => [29]
    }
  end
end
