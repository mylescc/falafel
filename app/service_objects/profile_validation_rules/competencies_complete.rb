module ProfileValidationRules
  class CompetenciesComplete
    def self.validate(user)
      result = ProfileValidationResult.new(:competencies)
      comps = user.user_competencies
      result.add_error("6 competencies are required") if comps.empty?
      result.add_error("#{6-comps.count} competencies are still required") if (1..4).include?(comps.count)
      result.add_error("1 more competency is still required") if comps.count == 5
      result
    end
  end
end
