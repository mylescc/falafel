class UserCompetency < ActiveRecord::Base
  include Competencies

  def self.unassigned_competencies(user_id)
    user_competencies = UserCompetency.where(user_id: user_id)
    unassigned = UserCompetency.competencies.reject{ |uc| user_competencies.map(&:competency).include?(uc) }
    unassigned.map do |comp|
      UserCompetency.new(user_id: user_id, competency: comp[0])
    end
  end

  def self.save_list(user_id, params)
    destroy_removed_competencies(user_id, params)
    params.each do |uc_hash|
      update_or_create(uc_hash)
    end
  end

  private

  def self.update_or_create(uc_hash)
    %w(created_at updated_at).each{ |k| uc_hash.delete(k) }
    user_competency = UserCompetency.where(id: uc_hash.delete("id")).first_or_initialize
    user_competency.update_attributes!(uc_hash)
  end

  def self.destroy_removed_competencies(user_id, params)
    competency_ids_present_in_params = params.map{ |uc_hash| uc_hash["id"] }.compact
    current_competencies = where(user_id: user_id)
    removed_competencies = current_competencies.reject{ |comp| competency_ids_present_in_params.include?(comp.id) }
    removed_competencies.map(&:destroy)
  end

end
