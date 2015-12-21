module ProfileValidationRules
  class BasicDetailsComplete
    def self.validate(user)
      result = ProfileValidationResult.new(:basic_details)
      result.add_error("have not been completed") unless user.personal_detail.present?
      result
    end
  end
end
