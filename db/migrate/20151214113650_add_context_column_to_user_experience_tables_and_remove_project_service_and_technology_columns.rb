class AddContextColumnToUserExperienceTablesAndRemoveProjectServiceAndTechnologyColumns < ActiveRecord::Migration
  def change
    remove_column :user_experience_applications, :project
    remove_column :user_experience_applications, :service
    remove_column :user_experience_applications, :technology
    remove_column :user_experience_infrastructures, :project
    remove_column :user_experience_infrastructures, :service
    add_column :user_experience_applications, :context, :integer
    add_column :user_experience_infrastructures, :context, :integer
    add_column :user_experience_languages, :context, :integer
  end
end
