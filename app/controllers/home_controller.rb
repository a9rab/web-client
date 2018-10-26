class HomeController < ApplicationController
  def index
    @family_members = User.current.family.members
  end
end
