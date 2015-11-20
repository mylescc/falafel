class AddActivityFieldsToUserExperienceIndustries < ActiveRecord::Migration
  def change
    rename_column :user_experience_industries, :primary_activity, :secondary_activity
    rename_column :user_experience_industries, :industry, :primary_activity
    add_column :user_experience_industries, :other_primary_activity, :string
    add_column :user_experience_industries, :other_secondary_activity, :string
    add_column :user_experience_industries, :company, :integer
    add_column :user_experience_industries, :in_last_five_years, :boolean
  end
end
