class UsersController < ApplicationController
  
    def create
      user_fields = user_params()
      user_fields[:take_pill] = false
      @user = User.new user_fields

      if @user.save
        session[:user_id] = @user.id 
        render json: @user, status: :created
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
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def user_params_update
        params.require(:user).permit(:first_name, :last_name, :take_pill, :notification_on)
    end
end