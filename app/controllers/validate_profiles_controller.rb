class ValidateProfilesController < ApplicationController

  def show
    set_no_cache_headers
    @profile_validation_summary = ProfileValidator.new(current_user).validate
    respond_to do |format|
      format.json do
        render status: 200, json: @profile_validation_summary
      end
    end
  end

  private

  def set_no_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
