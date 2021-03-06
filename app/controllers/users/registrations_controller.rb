class Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def new
        super 
    end


    private

    def respond_with(resource, _opts = {})
      register_success && return if resource.persisted?
  
      register_failed
    end
  
    def register_success
        render json: {message: "Signed up successfully!"}
    end
  
    def register_failed
      render json: { message: "Something went wrong." }
    end

    def sign_up_params
        params.require(:user).permit(:email, :username, :password, :password_confirmation)
    end
   
  end