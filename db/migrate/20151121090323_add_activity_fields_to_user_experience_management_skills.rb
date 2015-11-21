class AddActivityFieldsToUserExperienceManagementSkills < ActiveRecord::Migration
  def change
    rename_column :user_experience_management_skills, :primary_activity, :secondary_activity
    rename_column :user_experience_management_skills, :industry, :primary_activity
    add_column :user_experience_management_skills, :other_primary_activity, :string
    add_column :user_experience_management_skills, :other_secondary_activity, :string
    add_column :user_experience_management_skills, :expertise, :integer
    add_column :user_experience_management_skills, :in_last_five_years, :boolean
  end
end
