class VideoStatementsController < ApplicationController
  layout 'talent'

  def index
    #GP the user should only ever have one but index seemed more appropriate than show
    @video_statement = VideoStatement.where(user_id: current_user.id).last
  end

  def create
    #GP we need to delete the previous video so as the user only keeps one. Maybe the subsequent would
    #be more appropriate as an update but to keep it simple for now...
    @video_statement = VideoStatement.new(parsed_params[:video_statement])

    VideoStatement.transaction do
      VideoStatement.where(user_id: current_user.id).destroy_all
      @video_statement.save!
      redirect_to video_statements_path
    end
  end

  def destroy
    @video_statement = VideoStatement.find(params[:id])
    @video_statement.destroy
    flash[:notice] = "Video successfully removed..."
    redirect_to video_statements_path
  end

  private

  def parsed_params
    cam_params = params["VideoStatementCamera"]
    ActionController::Parameters.new(video_statement: {
      uuid: cam_params["video_uuid"], url: cam_params["qvga"]["video"],
      thumb_url: cam_params["qvga"]["thumb"], small_thumb_url: cam_params["qvga"]["small_thumb"],
      user_id: current_user.id
    }).permit!
  end

end
