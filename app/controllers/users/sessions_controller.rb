class Users::SessionsController < Devise::SessionsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
        @user = current_user.as_json
        puts request.env['warden-jwt_auth.token'].to_s

        puts @user
        unless request.env['warden-jwt_auth.token'].blank?
          @user['accessToken'] = request.env['warden-jwt_auth.token'].to_s
        end
        render json: @user, status: :ok
    end
  
    def respond_to_on_destroy
      log_out_success && return if current_user
  
      log_out_failure
    end
  
    def log_out_success
      render json: { message: "You are logged out." }, status: :ok
    end
  
    def log_out_failure
      render json: { message: "Hmm nothing happened."}, status: :unauthorized
    end
  end