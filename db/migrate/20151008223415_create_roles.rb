class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :role_type
      t.integer :min_salary
      t.integer :min_day_rate
      t.string :postcode
      t.integer :max_travel_distance
      t.integer :max_travel_time
      t.integer :num_permanent_roles
      t.integer :num_contracts
      t.integer :num_extensions
      t.integer :user_id
    end
 
    add_foreign_key :roles, :users
  end
end
