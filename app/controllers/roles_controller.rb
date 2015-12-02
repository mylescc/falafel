class RolesController < ApplicationController
  layout 'talent'

  def show
    @roles = roles_as_hash(user_roles)
    @role_distances = RoleDistance.all
    @travel_willingness_options = RoleTravelWillingnessOption.all
  end

  def update
    p update_roles_params
    user_roles.each_with_index do | role, index |
      role.save if role.new_record?
      role.update(update_roles_params[index])
    end
    return render json: { roles: user_roles }
  end



  private

  def user_roles
    existing = current_user.roles.reverse
    remainder = (1..(3-existing.count)).map{ |_| Role.new(user: current_user) }
    existing + remainder
  end

  def roles_as_hash(roles)
    roles.map do |role|
      role.attributes
    end
  end

  def update_roles_params
    result = params.require(:roles).map{|role| role.permit(*Role.attribute_names.reject{ |attrib| filtered_role_params.include?(attrib) }) }
    result.map do |role|
      role['position'] = role['position'].to_i
      role
    end
  end

  def filtered_role_params
    ['id', 'user_id']
  end

end
