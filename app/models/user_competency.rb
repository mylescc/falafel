class UserCompetency < ActiveRecord::Base

  enum competency: {'Verbal Communication' => 1, 'Written Communication' => 2, 'Customer Service' => 3,
    'Problem Solving' => 4, 'Analytical' => 5, 'Working Under Pressure' => 6, 'Team Player' => 7,
    'Strategic Thinker' => 8}

  def self.for_user(user_id)
    saved_ucs = UserCompetency.where(user_id: user_id).order(:rank)
    saved_ucs.empty? ? new_for_user(user_id) : saved_ucs
  end

  #save a new initialised list for the user if they don't have one. If we don't save it initially
  #then we have to do an extra step of passing the ids back to the UI after the first reorder
  #so it's easier to do it here for now when they first request a list
  def self.new_for_user(user_id)
    UserCompetency.competencies.keys.each_with_index.map do |comp, i|
      UserCompetency.create(user_id: user_id, competency: comp, rank: i)
    end
  end

end
