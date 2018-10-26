class SessionsController < ApplicationController
    skip_before_action :auth_user
    def create
        User.current = User.find_or_create_by email: params[:email], uid: params[:uid]
        render json: User.current
    end
end
