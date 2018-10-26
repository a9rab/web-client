class SessionsController < ApplicationController
    skip_before_action :auth_user
    def create
        User.current = User.find_or_create_by email: params[:email], uid: params[:uid]
        sign_in(User.current, scope: :user)
        render json: User.current
    end
end
