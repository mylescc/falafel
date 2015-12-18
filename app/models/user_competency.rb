class UserCompetency < ActiveRecord::Base

  enum competency: {'Verbal Communication' => 1, 'Written Communication' => 2, 'Customer Service' => 3,
    'Problem Solving' => 4, 'Analytical' => 5, 'Working Under Pressure' => 6, 'Team Player' => 7,
    'Strategic Thinker' => 8, 'Results Oriented' => 9, 'Planning' => 10, 'Stakeholder Engagement' => 11,
    'Negotiation' => 12, 'Influencing' => 13, 'Leadership' => 14, 'People Management' => 15, 'Multi-Tasking' => 16,
    'Salesmanship' => 17, 'Resilience' => 18}

  def self.unassigned_competencies(user_id)
    user_competencies = UserCompetency.where(user_id: user_id)
    unassigned = UserCompetency.competencies.reject{ |uc| user_competencies.map(&:competency).include?(uc) }
    unassigned.map do |comp|
      UserCompetency.new(user_id: user_id, competency: comp[0])
    end
  end

  def self.save_list(params)
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

end
