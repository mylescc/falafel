class AddRoleTravelWillingnessOptions < ActiveRecord::Migration
  def change
    create_table :role_travel_willingness_options do |t|
      t.integer :value
      t.string :label
    end

    add_column :roles, :role_travel_willingness_option_id, :integer
    add_foreign_key :roles, :role_travel_willingness_options

    RoleTravelWillingnessOption.create!(value: 10, label: '0%')
    RoleTravelWillingnessOption.create!(value: 20, label: '10%')
    RoleTravelWillingnessOption.create!(value: 25, label: '25%')
    RoleTravelWillingnessOption.create!(value: 50, label: '50%')
    RoleTravelWillingnessOption.create!(value: 100, label: '50+%')
  end
end
