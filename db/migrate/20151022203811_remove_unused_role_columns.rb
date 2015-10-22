class RemoveUnusedRoleColumns < ActiveRecord::Migration
  def change
    remove_column :roles, :permanent_work_travel_willingness, :integer
    remove_column :roles, :contract_work_travel_willingness, :integer
    remove_column :roles, :contract_max_travel_distance, :integer
    remove_column :roles, :permanent_max_travel_distance, :integer
    remove_column :roles, :max_travel_time, :integer
  end
end
