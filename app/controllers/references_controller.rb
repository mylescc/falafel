class ReferencesController < ApplicationController
  layout 'talent'

  def index
    load_references
    @reference = Reference.new
  end

  def create
    @reference = Reference.new(reference_params.merge(user_id: current_user.id))
    if @reference.save_and_send_request
      flash[:notice] = "Request sent..."
      redirect_to references_path
    else
      load_references
      render :index
    end
  end

  def show
    @reference = Reference.find(params[:id])
  end

  def destroy
    @reference = Reference.find(params[:id])
    @reference.destroy
    flash[:notice] = "Reference deleted..."
    redirect_to references_path
  end

  def send_reminder_email
    @reference = Reference.find(params[:id])
    @reference.send_reminder_email
    flash[:notice] = "Reminder sent..."
    redirect_to references_path
  end


  private

  def reference_params
    params.require(:reference).permit(
      :referee_first_name, :referee_last_name, :referee_email, :referee_email_text
    )
  end

  def load_references
    @references = Reference.where(user_id: current_user.id)
  end
end
