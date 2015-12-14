class UserExperienceIndustriesController < ApplicationController
  def create
    user_experience_industry = UserExperienceIndustry.new(user_experience_industries_params)
    unless user_experience_industry.save
      flash[:alert] = "There was a problem saving your industry. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_industry = UserExperienceIndustry.find(params[:id])
    user_experience_industry.destroy
    flash[:notice] = 'Industry successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_industries_params
    params.require(:user_experience_industry).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :in_last_five_years,
      :other_primary_activity, :other_secondary_activity
    )
  end
end
