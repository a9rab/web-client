class ApplicationController < ActionController::Base
    before_action :auth_user

    def auth_user
        if User.current.nil?
            redirect_to sign_in_url
        end
    end
end
