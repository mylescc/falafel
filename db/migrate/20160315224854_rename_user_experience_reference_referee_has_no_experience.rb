class RenameUserExperienceReferenceRefereeHasNoExperience < ActiveRecord::Migration
  def change
    rename_column :user_experience_references, :referee_has_no_experience, :referee_has_experience
    change_column :user_experience_references, :referee_has_experience, :boolean, default: true
  end
end
