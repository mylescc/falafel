class RemoveNameColumnFromUserExperienceRoles < ActiveRecord::Migration
  def change
    remove_column :user_experience_roles, :name
  end
end
