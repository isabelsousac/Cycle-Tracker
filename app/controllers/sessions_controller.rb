class SessionsController < ApplicationController
    def new # get /login
    end

    def create  #  post 'login'
        user = User.find_by :email => params[:email]
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash[:alert] = "User not found. Check your email or password."
            redirect_to login_path
        end
    end

    def destroy  #  delete 'login'
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out."
        redirect_to login_path
    end
end