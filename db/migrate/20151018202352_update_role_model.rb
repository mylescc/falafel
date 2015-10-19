class UpdateRoleModel < ActiveRecord::Migration
  def change
    # Change role type to two optional bools, as a role preference
    # can be for both permanent and contracts
    remove_column :roles, :role_type
    add_column :roles, :permanent, :bool, default: false
    add_column :roles, :contractor, :bool, default: false

    # A role preference needs a different postcode + max travel per both role type
    rename_column :roles, :postcode, :permanent_postcode
    add_column :roles, :contract_postcode, :string

    rename_column :roles, :max_travel_distance, :permanent_max_travel_distance
    add_column :roles, :contract_max_travel_distance, :integer

    # There's two inputs for notice period as well so..
    add_column :roles, :permanent_current_notice_period, :integer
    add_column :roles, :contractor_current_notice_period, :integer

    # Add willingness to travel with work
    add_column :roles, :permanent_work_travel_willingness, :integer
    add_column :roles, :contract_work_travel_willingness, :integer

    # Contract "available at" field
    add_column :roles, :contract_available_at, :datetime
  end
end
