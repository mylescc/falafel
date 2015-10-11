module HomeHelper
  def nav_personal_details_link(user)
    user.personal_detail ? edit_personal_detail_path(user.personal_detail) : new_personal_detail_path
  end

  def nav_role_preferences_link(user)
    #TODO add edit path when it's saving
    new_role_path
  end
end
