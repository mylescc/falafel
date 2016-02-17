class DropRedundantUserExperienceTables < ActiveRecord::Migration
  def change
    drop_table :user_experience_applications
    drop_table :user_experience_industries
    drop_table :user_experience_infrastructures
    drop_table :user_experience_languages
    drop_table :user_experience_management_skills
    drop_table :user_experience_methods
    drop_table :user_experience_roles
  end
end
