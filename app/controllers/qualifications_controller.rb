class QualificationsController < ApplicationController
  layout 'talent'

  def index
    load_qualifications
    @qualification = Qualification.new
  end

  def create
    @qualification = Qualification.new(qualification_params.merge(user_id: current_user.id))
    if @qualification.save
      redirect_to qualifications_path
    else
      load_qualifications
      render :index
    end
  end


  private

  def qualification_params
    params.require(:qualification).permit(
      :level, :institution, :grade, :user_id, :qualification_extra_description
    )
  end

  def load_qualifications
    @qualifications = Qualification.where(user_id: current_user.id)
  end
end
