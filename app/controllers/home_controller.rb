class HomeController < ApplicationController
  def index
    @family_members = current_user.family.members.where.not(email: current_user.email)
  end
end
