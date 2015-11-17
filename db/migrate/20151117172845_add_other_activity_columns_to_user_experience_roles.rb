class AddOtherActivityColumnsToUserExperienceRoles < ActiveRecord::Migration
  def change
    add_column :user_experience_roles, :other_primary_activity, :string
    add_column :user_experience_roles, :other_secondary_activity, :string
  end
end
