class CreateUserExperienceManagementSkills < ActiveRecord::Migration
  def change
    create_table :user_experience_management_skills do |t|
      t.integer :user_id
      t.integer :industry
      t.integer :primary_activity
      t.integer :years_experience
    end
  end
end
