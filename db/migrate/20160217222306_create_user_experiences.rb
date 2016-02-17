class CreateUserExperiences < ActiveRecord::Migration
  def change
    create_table :user_experiences do |t|
      t.integer  :user_id
      t.integer  :primary_activity
      t.integer  :years_experience
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :secondary_activity
      t.boolean  :in_last_five_years
      t.string   :other_primary_activity
      t.string   :other_secondary_activity
      t.string   :type
      t.timestamps
    end

    add_index :user_experiences, :user_id
    add_index :user_experiences, :type
  end
end
