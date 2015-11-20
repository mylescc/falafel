class UserExperienceRolesController < ApplicationController
  def create
    user_experience_role = UserExperienceRole.new(user_experience_roles_params.merge(user_id: current_user.id))
    unless user_experience_role.save
      flash[:alert] = "There was a problem saving your role. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_role = UserExperienceRole.find(params[:id])
    user_experience_role.destroy
    flash[:notice] = 'Role successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_roles_params
    params.require(:user_experience_role).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :other_primary_activity, :other_secondary_activity,
      :company, :expertise, :in_last_five_years
    )
  end
end
