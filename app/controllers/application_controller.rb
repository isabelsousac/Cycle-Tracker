class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    before_action :is_authorized

    def is_authorized
        render json: {error: "Please, log in first."}, status: 401 unless is_signed_in
    end
    
    def is_signed_in
        !!current_user # returns a boolean
    end

    def current_user # if this method returns nil, the error message from is_authorized will be rendered
        auth_header = request.headers["Authorization"]
        if auth_header
            user_token = auth_header.split(' ')[1] # grabs only user token from all auth header
            begin
                @user_id = JWT.decode(user_token, Rails.application.secrets.secret_key_base[0])[0]["user_id"] # the encoded jwt secret returns an array, we take the first element that belongs to the user, inside this element has the user hash. The user id is what we need
            rescue JWT::DecodeError
                nil 
            end
        end

        if @user_id
            @user = User.find(@user_id)
        else
            nil
        end
    end

end
