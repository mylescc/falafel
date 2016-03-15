class UserExperienceReferencesController < ApplicationController
  def create
    @user_experience_reference = UserExperienceReference
      .new(user_experience_reference_params)
    @user_experience_reference.save!
    render json: @user_experience_reference, status: :ok
  end

  def update
    @user_experience_reference = UserExperienceReference.find(params[:id])
    @user_experience_reference
      .update_attributes!(user_experience_reference_params)
    render json: @user_experience_reference, status: :ok
  end

private
  def user_experience_reference_params
    params.require(:user_experience_reference).permit(
      :user_experience_id,
      :reference_id,
      :expertise,
      :in_last_five_years,
      :referee_has_experience,
    )
  end
end
