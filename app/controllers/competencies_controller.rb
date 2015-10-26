class CompetenciesController < ApplicationController
  layout 'talent'

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: UserCompetency.for_user(current_user.id).to_json
      end
    end
  end

  def reorder
    respond_to do |format|
      format.json do
        JSON.parse(request.body.read).each do |comp_hash|
          UserCompetency.where(id: comp_hash["id"]).update_all(rank: comp_hash["rank"])
        end
        render status: 200, json: {ok: true}
      end
    end
  end

end
