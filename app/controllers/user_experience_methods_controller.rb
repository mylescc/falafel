class UserExperienceMethodsController < ApplicationController
  def create
    user_experience_method = UserExperienceMethod.new(user_experience_method_params)
    unless user_experience_method.save
      flash[:alert] = "There was a problem saving your method. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_method = UserExperienceMethod.find(params[:id])
    user_experience_method.destroy
    flash[:notice] = 'Method successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_method_params
    params.require(:user_experience_method).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :company, :in_last_five_years,
      :other_primary_activity, :other_secondary_activity
    )
  end
end
