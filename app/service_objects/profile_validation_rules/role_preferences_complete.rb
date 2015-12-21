module ProfileValidationRules
  class RolePreferencesComplete
    def self.validate(user)
      result = ProfileValidationResult.new(:role_preferences)
      result.add_error("at least one role must be specified") if user.roles.empty?
      result
    end
  end
end
