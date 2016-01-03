class ProfileValidator
  RULES = [
    ProfileValidationRules::BasicDetailsComplete,
    ProfileValidationRules::RolePreferencesComplete,
    ProfileValidationRules::VideoStatementPresent,
    ProfileValidationRules::CompetenciesComplete,
    ProfileValidationRules::ReferencesComplete,
    ProfileValidationRules::ExperienceComplete
  ]

  def initialize(user)
    @user = user
    @summary = ProfileValidationSummary.new(user)
  end

  def validate
    RULES.each do |rule|
      summary.add_result(rule.validate(user))
    end
    summary
  end

  def user
    @user
  end

  private

  def summary
    @summary
  end

end



