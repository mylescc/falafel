class CompetenciesController < ApplicationController
  layout 'talent'

  def index
    @user_competencies = current_user.user_competencies
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @user_competency = UserCompetency.find(params[:id])
    @user_competency.destroy if @user_competency
    respond_to do |format|
      format.json do
        render status: 200, json: {ok: true}
      end
    end
  end

  def save_list
    user_id = current_user.id
    respond_to do |format|
      format.json do
        competencies = JSON.parse(request.body.read)
        UserCompetency.save_list(user_id, competencies)
        render status: 200, json: {ok: true}
      end
    end
  end
end
