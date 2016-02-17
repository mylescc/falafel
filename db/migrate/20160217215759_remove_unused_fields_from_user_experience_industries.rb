class RemoveUnusedFieldsFromUserExperienceIndustries < ActiveRecord::Migration
  def change
    remove_column :user_experience_industries, :company, :integer
  end
end
