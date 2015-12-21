class ProfileValidationResult
  attr_reader :section_name

  def initialize(section_name)
    @section_name = section_name
    @errors = []
    @recommendations = []
  end

  def add_error(error)
    errors << error
  end

  def add_recommendation(recommendation)
    recommendations << recommendation
  end

  def valid?
    errors.empty?
  end

  def errors
    @errors
  end

  def recommendations
    @recommendations
  end

  def as_json(options={})
    {section_name: section_name, valid: valid?, errors: errors, recommendations: recommendations}
  end
end
