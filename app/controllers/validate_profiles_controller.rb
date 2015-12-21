class ValidateProfilesController < ApplicationController

  def show
    @profile_validation_summary = ProfileValidator.new(current_user).validate
    respond_to do |format|
      format.json do
        render status: 200, json: @profile_validation_summary
      end
    end
  end

end
