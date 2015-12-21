module ProfileValidationRules
  class ReferencesComplete
    def self.validate(user)
      refs = user.references
      result = ProfileValidationResult.new(:references)
      result.add_recommendation("we recommend obtaining 3 references") if refs.count < 3
      result.add_error("at least 1 reference is required") if refs.empty?
      result
    end
  end
end
