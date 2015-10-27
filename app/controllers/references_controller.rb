class ReferencesController < ApplicationController
  layout 'talent'

  def index
    load_references
    @reference = Reference.new(referee_email_text: "I'd like you to verify my work profile on the fused4 talent platform.\n\nbest wishes\n\n#{current_user.email} (need to store first name)")
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
