module ProfileValidationRules
  class VideoStatementPresent
    def self.validate(user)
      result = ProfileValidationResult.new(:video_statement)
      result.add_error("video statement has not been recorded") unless user.video_statement.present?
      result
    end
  end
end
