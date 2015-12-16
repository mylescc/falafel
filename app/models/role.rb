class Role < ActiveRecord::Base
  belongs_to :user

  belongs_to :permanent_role_distance,
          class_name: 'RoleDistance',
          foreign_key: 'permanent_role_distance_id'

  belongs_to :contract_role_distance,
          class_name: 'RoleDistance',
          foreign_key: 'contract_role_distance_id'

  belongs_to :permanent_role_travel_willingness_option,
          class_name: 'RoleTravelWillingnessOption',
          foreign_key: 'permanent_role_travel_willingness_option_id'

  belongs_to :contract_role_travel_willingness_option,
          class_name: 'RoleTravelWillingnessOption',
          foreign_key: 'contract_role_travel_willingness_option_id'

  validates_presence_of :user

  enum position: {
    'Architect': 1,
    'Business Analyst': 2,
    'Developer': 3,
    'Development Manager': 4,
    'Graduate': 5,
    'Head of Architecture': 6,
    'Head of Development': 7,
    'Head of Operations': 8,
    'Head of Service Delivery': 9,
    'IT Consultant': 10,
    'IT Director/CIO': 11,
    'IT Operations Manager': 12,
    'IT Support Analyst': 13,
    'IT Trainer': 14,
    'PMO Analyst': 15,
    'PMO Manager': 16,
    'Programme Manager': 17,
    'Project Manager': 18,
    'Service Delivery Manager': 19,
    'Service Desk Analyst': 20,
    'Service Desk Manager': 21,
    'Test Analyst': 22,
    'Test Manager': 23
  }

  def position=(val)
    write_attribute :position, val.to_i
  end
end
