class RolesController < ApplicationController
  layout 'talent'

  def new
    #just mocking sending down the three user
    # roles in the laziest way i could think of
    @roles = [
      Role.new(user: current_user, min_salary: 60000, min_day_rate: 550),
      Role.new(user: current_user, min_salary: 40000, min_day_rate: 450),
      Role.new(user: current_user, min_salary: 20000, min_day_rate: 250)
    ]
  end

  def create
  end
end
