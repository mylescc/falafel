class RolesController < ApplicationController
  layout 'talent'

  def show
    @roles = user_roles
    @role_distances = RoleDistance.all
    @travel_willingness_options = RoleTravelWillingnessOption.all
  end

  def update
    p params
    return render json: { test: 'hoho' }
  end

  private

  def user_roles
    existing = current_user.roles
    remainder = (1..(3-existing.count)).map{ |_| Role.new(user: current_user) }
    existing + remainder
  end

end
