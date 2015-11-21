class UserExperienceApplicationsController < ApplicationController
  def create
    user_experience_application = UserExperienceApplication.new(user_experience_application_params)
    unless user_experience_application.save
      flash[:alert] = "There was a problem saving your industry. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_application = UserExperienceApplication.find(params[:id])
    user_experience_application.destroy
    flash[:notice] = 'Application successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_application_params
    params.require(:user_experience_application).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :expertise, :company, :project,
      :service, :technology, :in_last_five_years, :other_primary_activity, :other_secondary_activity
    )
  end
end
