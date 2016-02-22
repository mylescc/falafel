class ReferenceBuilderPresenter
  attr_reader :user_experiences

  def self.load(reference)
    ReferenceBuilderPresenter.new(reference)
  end

  def initialize(reference)
    @reference = reference
    @user = @reference.user
    @user_experiences = UserExperience.where(user_id: @user.id)
  end

  def applications
    user_experiences.select{ |exp| exp.is_a?(UserExperienceApplication) }
  end

  def industries
    user_experiences.select{ |exp| exp.is_a?(UserExperienceIndustry) }
  end

  def infrastructures
    user_experiences.select{ |exp| exp.is_a?(UserExperienceInfrastructure) }
  end

  def languages
    user_experiences.select{ |exp| exp.is_a?(UserExperienceLanguage) }
  end

  def management_skills
    user_experiences.select{ |exp| exp.is_a?(UserExperienceManagementSkill) }
  end

  def methods
    user_experiences.select{ |exp| exp.is_a?(UserExperienceMethod) }
  end

  def roles
    user_experiences.select{ |exp| exp.is_a?(UserExperienceRole) }
  end

  def partial_path(experience)
    "references/#{experience.class.to_s.underscore}"
  end

  def primary_activity(experience)
    experience.other_primary_activity.blank? ? experience.primary_activity : experience.other_primary_activity
  end

  def secondary_activity(experience)
    experience.other_secondary_activity.blank? ? experience.secondary_activity :  experience.other_secondary_activity
  end

  def has_secondary_activity?(experience)
    secondary_activity(experience).present?
  end

  def other_secondary_entered?(experience)
    #handle empty strings that return true if we use present
    !experience.other_secondary_activity.blank?
  end
end
