class UserExperienceRolesController < ApplicationController
  def create
    user_experience_role = UserExperienceRole.new(user_experience_roles_params)
    unless user_experience_role.save
      flash[:alert] = "There was a problem saving your role. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  private

  def user_experience_roles_params
    params.require(:user_experience_role).permit(
      :user_id, :name, :primary_activity, :years_experience
    )
  end
end
