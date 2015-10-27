class AddTimestampsToUserExperiences < ActiveRecord::Migration
  def change
    change_table(:user_experience_roles){ |t| t.timestamps }
    change_table(:user_experience_management_skills){ |t| t.timestamps }
    change_table(:user_experience_industries){ |t| t.timestamps }
  end
end
