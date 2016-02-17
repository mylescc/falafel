class RemoveUnusedFieldsFromUserExperienceLanguages < ActiveRecord::Migration
  def change
    remove_column :user_experience_languages, :expertise, :integer
  end
end
