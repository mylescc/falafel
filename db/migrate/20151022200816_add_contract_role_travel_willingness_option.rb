class AddContractRoleTravelWillingnessOption < ActiveRecord::Migration
  def change
    remove_column :roles, :role_travel_willingness_option_id
    add_column :roles, :contract_role_travel_willingness_option_id, :integer
    add_column :roles, :permanent_role_travel_willingness_option_id, :integer
  end
end
