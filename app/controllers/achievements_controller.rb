class AchievementsController < ApplicationController
  layout 'talent'

  def index
    load_achievements
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params.merge(user_id: current_user.id))
    if @achievement.save
      redirect_to achievements_path
    else
      load_achievements
      render :index
    end
  end

  def destroy
    achievement = Achievement.find(params[:id])
    achievement.destroy if achievement
    redirect_to achievements_path, flash: { notice: 'Achievement deleted' }
  end


  private

  def achievement_params
    params.require(:achievement).permit(
      :title, :link, :user_id, :attachment
    )
  end

  def load_achievements
    @achievements = Achievement.where(user_id: current_user.id)
  end
end
