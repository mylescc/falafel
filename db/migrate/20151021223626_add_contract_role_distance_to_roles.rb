class AddContractRoleDistanceToRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :role_distance_id, :integer
    add_column :roles, :contract_role_distance_id, :integer
    add_column :roles, :permanent_role_distance_id, :integer
  end
end
