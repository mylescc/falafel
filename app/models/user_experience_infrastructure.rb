class UserExperienceInfrastructure < UserExperience
  #validates :user, :primary_activity, presence: true
  add_enums :years_experience, :context

  enum primary_activity: {
    'Infrastructure' => 1,
    'Active Directory' => 2,
    'Citrix' => 3,
    'Cloud' => 4,
    'Communications' => 5,
    'Data Centre' => 6,
    'Exchange / Messaging' => 7,
    'Network' => 8,
    'Office Products' => 9,
    'Operating Systems' => 10,
    'Server Management' => 11,
    'Telephony/Mobile' => 12,
    'Virtualisation' => 13
  }

  enum secondary_activity: {
    'XenApp' => 1,
    'XenDesktop' => 2,
    'XenServer' => 3,
    'AWS' => 4,
    'Azure' => 5,
    'EC2' => 6,
    'S3' => 7,
    'VPC' => 8,
    'IP' => 9,
    'OSS/BSS' => 10,
    'VoIP' => 11,
    'WiFi' => 12,
    'CISCO' => 13,
    'Data' => 14,
    'Firewall' => 15,
    'LAN' => 16,
    'Security' => 17,
    'WAN' => 18,
    '3Com' => 19,
    'Office 2003' => 20,
    'Office 2007' => 21,
    'Office 2010' => 22,
    'Office 2013' => 23,
    'Office 365' => 24,
    'Lotus' => 25,
    'Microsoft Exchange' => 26,
    'Avaya' => 27,
    'Blackberry' => 28,
    'Mitel' => 29
  }

  def self.secondary_activity_map
    {
      #citrix
      3 => [1, 2, 3],
      #cloud
      4 => [4, 5, 6, 7 ,8],
      #communiciations
      5 => [9, 10, 11, 12],
      #network
      8 => (12..19).to_a,
      #office products
      9 => (20..24).to_a,
      #service management
      11 => [25, 26],
      #telephony/mobile
      12 => [27, 28, 29]
    }
  end
end
