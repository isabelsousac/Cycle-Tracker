class UsersController < ApplicationController
	skip_before_action :is_authorized, only: [:create, :login, :index]

	def user_profile
		render json: @user
	end

    def index # we don't need this, but it's good for debugging
		@users = User.all
      	render json: @users
    end
  
    def create
      	user_fields = user_params()
      	user_fields[:take_pill] = false
      	@user = User.new user_fields

      	if @user.save
			@token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: @user, token: @token}, status: 201
		else 
			render json: @user.errors.full_messages, status: 400
		end
    end

    def update
        @user = User.update user_params_update

        if @user.save
            render json: @user, status: :ok
        else 
            render status: 400 # https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422
        end
    end

    def login
        @user = User.find_by :email => params[:email]

        if @user.present? && @user.authenticate(params[:password])
            @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: @user, token: @token}
        else
            render json: {error: "Invalid email or password"}, status: :unauthorized
        end
    end
  
    private
  
    def user_params
      	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def user_params_update
        params.require(:user).permit(:first_name, :last_name, :take_pill, :notification_on)
    end
end