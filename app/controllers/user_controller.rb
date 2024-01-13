class UserController < ApplicationController
  before_action :authorize_request, except: :create

  def create 
    user = User.create!(user_params)
    @token = JsonWebToken.jwt_encode(user_id: user.id)
    render json: {
        user: user, 
        token: @token
    }, status: :created
  end

  private

  def user_params 
    params.require(:user).permit(:email, :first_name, :last_name, :password, :username)
  end
end
