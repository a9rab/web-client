class HomeController < ApplicationController
  def index
    @family_members = current_user.family.members
  end
end
