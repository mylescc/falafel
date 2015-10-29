class VideoStatementsController < ApplicationController
  layout 'talent'

  def show
    @video_statement = VideoStatement.where(user_id: current_user.id).last
  end

  def create
    @video_statement = VideoStatement.new(parsed_params[:video_statement])
    if @video_statement.save
      redirect_to video_statement_path
    end
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
