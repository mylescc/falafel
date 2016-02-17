class RemoveUnusedFieldsFromUserExperienceInfrastructures < ActiveRecord::Migration
  def change
    remove_column :user_experience_infrastructures, :expertise, :integer
    remove_column :user_experience_infrastructures, :company, :integer
  end
end
