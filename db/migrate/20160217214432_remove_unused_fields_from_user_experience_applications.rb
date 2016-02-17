class RemoveUnusedFieldsFromUserExperienceApplications < ActiveRecord::Migration
  def change
    remove_column :user_experience_applications, :expertise, :integer
    remove_column :user_experience_applications, :company, :integer
  end
end
