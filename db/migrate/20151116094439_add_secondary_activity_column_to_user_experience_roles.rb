class AddSecondaryActivityColumnToUserExperienceRoles < ActiveRecord::Migration
  def change
    add_column :user_experience_roles, :secondary_activity, :integer
    add_index :user_experience_roles, :secondary_activity
  end
end
