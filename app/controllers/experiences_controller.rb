class ExperiencesController < ApplicationController
  layout 'talent'

  def show
    @experience = OpenStruct.new(
      roles: UserExperienceRole.where(user_id: current_user.id),
      industries: UserExperienceIndustry.where(user_id: current_user.id),
      management_skills: UserExperienceManagementSkill.where(user_id: current_user.id),
    )
  end
end
