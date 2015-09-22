class PersonalDetailsController < ApplicationController
  layout 'talent'

  before_action :load_details, only: [:update]

  def new
    @details = PersonalDetail.new(email: current_user.email)
  end

  def edit
    @details = current_user.personal_detail
  end

  def create
    @details = PersonalDetail.new(permitted_params.merge(user_id: current_user.id))
    if @details.valid?
      @details.save
      flash.notice = 'Personal details saved'
      render :edit
    else
      flash.alert = 'The details are not correct'
      render :new
    end
  end

  def update
    @details.update_attributes(permitted_params)
    flash.notice = 'Personal details updated'
    render :edit
  end

  def show

  end

  private

  def permitted_params
    params.require(:personal_detail).permit(:name, :email, :phone, :postcode)
  end

  def load_details
    @details = PersonalDetail.find(params[:id])
  end
end
