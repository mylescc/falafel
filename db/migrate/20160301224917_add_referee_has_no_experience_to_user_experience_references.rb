class AddRefereeHasNoExperienceToUserExperienceReferences < ActiveRecord::Migration
  def change
    add_column :user_experience_references,
      :referee_has_no_experience,
      :boolean,
      default: true
  end
end
