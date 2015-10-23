class CreateUserExperienceRoles < ActiveRecord::Migration
  def change
    create_table :user_experience_roles do |t|
      t.integer :user_id
      t.string :name
      t.integer :primary_activity
      t.integer :years_experience
    end
  end
end
