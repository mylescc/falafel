class UserExperienceApplication < ActiveRecord::Base
  include CommonExperienceEnumerations
  include ActivityMapper
  belongs_to :user
  #validates :user, :primary_activity, presence: true

  enum primary_activity: {
    'Aquila' => 1,
    'BI/MIS' => 2,
    'Content Management' => 3,
    'CRM' => 4,
    'Epicor' => 5,
    'ePOS' => 6,
    'Front Office' => 7,
    'Hybris' => 8,
    'HRIS/HRMS' => 9,
    'Infor' => 10,
    'Microsoft Dynamics' => 11,
    'Mobile' => 12,
    'Multi/Omni Channel' => 13,
    'Oracle' => 14,
    'SaaS' => 15,
    'Sage' => 16,
    'Salesforce' => 17,
    'SAP' => 18,
    'Sharepoint' => 19,
    'VMWare' => 20
  }

  enum secondary_activity: {
    'Cognos' => 1,
    'Business Objects' => 2,
    'Crystal Reports' => 3,
    'Qlikview' => 4,
    'Drupal' => 5,
    'Episerver' => 6,
    'Teamsite' => 7,
    'AX' => 8,
    '-CRM' => 9,
    'C5' => 10,
    'GP' => 11,
    'NAV' => 12,
    'PoS' => 13,
    'RMS' => 14,
    'SL' => 15,
    'eBusiness Suite' => 16,
    'ERP' => 17,
    'Financials' => 18,
    'Fusion' => 19,
    'HRMS' => 20,
    'Hyperion' => 21,
    'JD Edwards' => 22,
    'Payroll' => 23,
    'Peoplesoft' => 24,
    'PL/SQL' => 25,
    'RDBMS' => 26,
    'SCM' => 27,
    'ABAP/4' => 28,
    'Basis' => 29,
    'BI' => 30,
    'BW' => 31,
    'FICO' => 32,
    'FSCM' => 33,
    'HCM' => 34,
    'IS' => 35,
    'MDM' => 36,
    'MM' => 37,
    'Netweaver' => 38,
    'PM' => 39,
    'PP' => 40,
    'PS' => 41,
    'QM' => 42,
    'SD' => 43,
    'SRM' => 44,
    'XI' => 45
  }

  add_enums :years_experience, :expertise, :company, :project, :service, :technology

  def self.secondary_activity_map
    {
      #bi/mis
      2 => [1, 2, 3, 4],
      #content management
      3 => [5,6,7],
      #microsoft dynamics
      11 => (9..15).to_a,
      #oracle
      14 => [9].concat((16..27).to_a),
      #sap
      18 => (28..45).to_a
    }
  end
end
