class SetDefaultRefereeHasNoExperienceToFalse < ActiveRecord::Migration
  def change
    change_column :user_experience_references, :referee_has_no_experience, :boolean, default: false
  end
end
