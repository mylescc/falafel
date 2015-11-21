class ExperiencesController < ApplicationController
  layout 'talent'

  def show
    @experience = OpenStruct.new(
      roles: UserExperienceRole.where(user_id: current_user.id),
      industries: UserExperienceIndustry.where(user_id: current_user.id),
      management_skills: UserExperienceManagementSkill.where(user_id: current_user.id),
      ue_methods: UserExperienceMethod.where(user_id: current_user.id),
      applications: UserExperienceApplication.where(user_id: current_user.id),
      languages: UserExperienceLanguage.where(user_id: current_user.id),
      infrastructures: UserExperienceInfrastructure.where(user_id: current_user.id)
    )
  end
end
