class UserExperienceManagementSkillsController < ApplicationController
  def create
    user_experience_management_skill = UserExperienceManagementSkill.new(user_experience_management_skills_params)
    unless user_experience_management_skill.save
      flash[:alert] = "There was a problem saving your management_skill. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_management_skill = UserExperienceManagementSkill.find(params[:id])
    user_experience_management_skill.destroy
    flash[:notice] = 'Role successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_management_skills_params
    params.require(:user_experience_management_skill).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :in_last_five_years,
      :other_primary_activity, :other_secondary_activity
    )
  end
end
