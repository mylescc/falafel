class CreateUserExperienceMethods < ActiveRecord::Migration
  def change
    create_table :user_experience_methods do |t|
      t.integer  :user_id
      t.integer  :primary_activity
      t.integer  :secondary_activity
      t.string   :other_primary_activity
      t.string   :other_secondary_activity
      t.integer  :years_experience
      t.integer  :expertise
      t.boolean  :in_last_five_years
      t.timestamps
    end

    add_index :user_experience_methods, :user_id
  end
end
