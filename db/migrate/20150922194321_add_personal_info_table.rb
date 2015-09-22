class AddPersonalInfoTable < ActiveRecord::Migration
  def change
    create_table :personal_details do |t|
      t.string :name
      t.string :postcode
      t.string :phone
      t.integer :uk_status
      t.integer :user_id
      t.timestamps
    end

    add_foreign_key :personal_details, :users
  end
end
