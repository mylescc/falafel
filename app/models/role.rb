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
end
