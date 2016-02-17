class RemoveUnusedFieldsFromUserExperienceRoles < ActiveRecord::Migration
  def change
    remove_column :user_experience_roles, :expertise, :integer
    remove_column :user_experience_roles, :company, :integer
  end
end
