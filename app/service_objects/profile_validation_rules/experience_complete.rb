module ProfileValidationRules
  class ExperienceComplete
    def self.validate(user)
      result = ProfileValidationResult.new(:experience)
      role_has_one_row(result, user)
      industry_has_one_row(result, user)
      has_one_other_row(result, user)
      result
    end

    private


    def self.role_has_one_row(result, user)
      result.add_error("At least 1 Experience entry is required") if user.user_experience_roles.count < 1
    end

    def self.industry_has_one_row(result, user)
      result.add_error("At least 1 Industry entry is required") if user.user_experience_industries.count < 1
    end

    def self.has_one_other_row(result, user)
      total_rows = user.user_experience_management_skills.count +
        user.user_experience_methods.count +
        user.user_experience_applications.count +
        user.user_experience_languages.count +
        user.user_experience_infrastructures.count
      result.add_error("At least 1 entry from Management Skills, Methods, Applications, Development Languages or
                        Infrastructure is required") if total_rows < 1
    end
  end
end
