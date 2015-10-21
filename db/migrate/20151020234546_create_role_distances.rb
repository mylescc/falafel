class CreateRoleDistances < ActiveRecord::Migration
  def change
    create_table :role_distances do |t|
      t.integer :distance
      t.string :label
    end

    add_column :roles, :role_distance_id, :integer
    add_foreign_key :roles, :role_distances

    RoleDistance.create!(distance: 10, label: 'Up to 10 miles')
    RoleDistance.create!(distance: 20, label: 'Up to 20 miles')
    RoleDistance.create!(distance: 50, label: 'Up to 50 miles')
    RoleDistance.create!(distance: 100, label: 'Up to 100 miles')
    RoleDistance.create!(distance: nil, label: 'Any UK')
    RoleDistance.create!(distance: nil, label: 'International')
  end
end
