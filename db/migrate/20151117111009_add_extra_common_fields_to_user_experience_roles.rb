class AddExtraCommonFieldsToUserExperienceRoles < ActiveRecord::Migration
  def change
    add_column :user_experience_roles, :expertise, :integer
    add_column :user_experience_roles, :company, :integer
    add_index :user_experience_roles, :expertise
    add_index :user_experience_roles, :company
  end
end
