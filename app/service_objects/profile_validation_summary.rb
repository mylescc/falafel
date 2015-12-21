class ProfileValidationSummary
  def initialize(user)
    @user = user
    @results = []
  end

  def valid?
    results.reject{ | result | result.valid? }.empty?
  end

  def add_result(result)
    results << result
  end

  def results_for(section_name)
    results.find{ |result| result.section_name == section_name }
  end

  def results
    @results
  end

  def as_json(options={})
    {user_id: user.id, valid: valid?, results: results}
  end

  private

  def user
    @user
  end
end
