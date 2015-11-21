class UserExperienceInfrastructuresController < ApplicationController
  def create
    user_experience_infrastructure = UserExperienceInfrastructure.new(user_experience_infrastructures_params)
    unless user_experience_infrastructure.save
      flash[:alert] = "There was a problem saving your infrastrcuture. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_infrastructure = UserExperienceInfrastructure.find(params[:id])
    user_experience_infrastructure.destroy
    flash[:notice] = 'Infrastructure successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_infrastructures_params
    params.require(:user_experience_infrastructure).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :expertise, :company, :project, :service,
      :in_last_five_years, :other_primary_activity, :other_secondary_activity
    )
  end
end
