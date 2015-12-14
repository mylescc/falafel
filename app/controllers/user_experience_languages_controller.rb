class UserExperienceLanguagesController < ApplicationController
  def create
    user_experience_language = UserExperienceLanguage.new(user_experience_language_params)
    unless user_experience_language.save
      flash[:alert] = "There was a problem saving your method. Please try again and ensure all fields are completed"
    end
    redirect_to experience_path
  end

  def destroy
    user_experience_language = UserExperienceLanguage.find(params[:id])
    user_experience_language.destroy
    flash[:notice] = 'Language successfully deleted'
    redirect_to experience_path
  end

  private

  def user_experience_language_params
    params.require(:user_experience_language).permit(
      :user_id, :primary_activity, :secondary_activity, :years_experience, :context, :in_last_five_years,
      :other_primary_activity, :other_secondary_activity
    )
  end
end
