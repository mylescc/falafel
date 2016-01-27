class ReferenceBuilderPresenter
  attr_reader :reference, :user, :applications, :industries, :infrastructures,
    :languages, :management_skills, :methods, :roles

  def self.load(reference)
    ReferenceBuilderPresenter.new(reference)
  end

  def initialize(reference)
    @reference = reference
    @user = @reference.user
    @applications = UserExperienceApplication.where(user_id: @user.id)
    @industries = UserExperienceIndustry.where(user_id: @user.id)
    @infrastructures = UserExperienceInfrastructure.where(user_id: @user.id)
    @languages = UserExperienceLanguage.where(user_id: @user.id)
    @management_skills = UserExperienceManagementSkill.where(user_id: @user.id)
    @methods = UserExperienceMethod.where(user_id: @user.id)
    @roles = UserExperienceRole.where(user_id: @user.id)
  end

  def all_experience
    applications + industries + infrastructures + languages +
      management_skills + methods + roles
  end

  def partial_path(experience)
    "references/#{experience.class.to_s.underscore}"
  end

  def has_secondary_activity?(experience)
    other_secondary_entered?(experience) ||
      experience.secondary_activity.present?
  end

  def other_secondary_entered?(experience)
    #handle empty strings that return true if we use present
    !experience.other_secondary_activity.blank?
  end
end
