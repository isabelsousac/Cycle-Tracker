class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    before_action :get_current_user

    def get_current_user
        @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
        session[:user_id] = nil unless @current_user.present?
    end
end
