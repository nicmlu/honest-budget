class SessionsController < ApplicationController
    def destroy
        session.clear 
        redirect_to root_path
    end 

    def create
      user = User.find_by(email: user_params[:email])
      if user && user.authenticate(user_params[:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
      else 
          flash[:message] = "Incorrect login information. Please try again."
          redirect_to login_path
      end 
    end 


    private
    
    def user_params
        params.require(:user).permit(:email, :password)
    end

end 
