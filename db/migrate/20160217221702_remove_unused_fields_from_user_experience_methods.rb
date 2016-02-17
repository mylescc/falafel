class RemoveUnusedFieldsFromUserExperienceMethods < ActiveRecord::Migration
  def change
    remove_column :user_experience_methods, :expertise, :integer
  end
end
