class AddUserIdIndexesToExperienceTables < ActiveRecord::Migration
  def change
    add_index :user_experience_roles, :user_id
    add_index :user_experience_management_skills, :user_id
    add_index :user_experience_industries, :user_id
  end
end
