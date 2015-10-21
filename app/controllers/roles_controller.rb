class RolesController < ApplicationController
  layout 'talent'

  def show
    #just mocking sending down the three user
    # roles in the laziest way i could think of
    @roles = [
      Role.new(user: current_user, min_salary: 60000, min_day_rate: 550),
      Role.new(user: current_user, min_salary: 40000, min_day_rate: 450),
      Role.new(user: current_user, min_salary: 20000, min_day_rate: 250)
    ]
    @role_distances = RoleDistance.all
    @travel_willingness_options = RoleTravelWillingnessOption.all
  end

  def update
  end
end
