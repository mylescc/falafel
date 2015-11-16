class AddInLastFiveYearsToUserExperienceRoles < ActiveRecord::Migration
  def change
    add_column :user_experience_roles, :in_last_five_years, :boolean
  end
end
