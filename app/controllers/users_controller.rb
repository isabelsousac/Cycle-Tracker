class UsersController < ApplicationController

    def new
      @user = User.new
    end
  
    def create
      @user = User.new user_params

      if @user.save
        session[:user_id] = @user.id 
        redirect_to cycle_path
      else
        render :json => :new
      end
    end
    
    def edit
    end

    def update
        @user = User.update user_params_update

        if @user.save
            redirect_to cycle_path
        else 
            render :json => :status  
        end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_params_update
        params.require(:user).permit(:name, :email)
    end
end