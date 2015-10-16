class RolesController < ApplicationController
  layout 'talent'

  def new
    @role = Role.new(user: current_user)
  end

  def create
  end
end
