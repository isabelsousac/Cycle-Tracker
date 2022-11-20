class SessionsController < ApplicationController
    def create  #  post 'login'
        @user = User.find_by :email => params[:email]
        if @user.present? && @user.authenticate(params[:password])
            # session[:user_id] = @user.id
            # render json: @user, status: :ok

            @token = JWT.encode({user_id: @user.id}, Rails.application.secrets.secret_key_base[0])
            render json: {user: @user, token: @token}
        else
            render json: {error: "Invalid credentials"}, status: :unauthorized
        end
    end

    def destroy  #  delete 'login'
        session[:user_id] = nil
        render json: status: :ok
    end
end