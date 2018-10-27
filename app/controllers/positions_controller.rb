class PositionsController < ApplicationController
    skip_before_action :auth_user
    skip_before_action :verify_authenticity_token

    def index
        unless params[:email].nil?
            render json: User.find_by_email(params[:email]).family.members.where.not(email: params[:email]).map(&:last_known_location)
        end
    end

    def show
        render json: User.find_by_email(params[:email]).last_known_location
    end

    def create
        user = User.find_by_email params[:email]
        user.positions.create! lat: params[:lat], lng: params[:long]
    end
end
