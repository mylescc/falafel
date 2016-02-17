class RemoveUnusedFieldsFromUserExperienceManagementSkills < ActiveRecord::Migration
  def change
    remove_column :user_experience_management_skills, :expertise, :integer
  end
end
