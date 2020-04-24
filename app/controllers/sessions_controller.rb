class SessionsController < ApplicationController
    def home
      if is_logged_in? 
        redirect_to user_path(current_user)
      else
        render :home
      end
      
    end 

    def new
    end 
   
   def create 
    if auth
      @user = User.find_or_create_by(email: auth['info']['email'])
        @user.first_name = auth["info"]["first_name"]
        @user.last_name = auth["info"]["last_name"]
        @user.password = SecureRandom.hex 
            if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
            else
                redirect_to root_path
            end
    else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:email])
                session[:user_id] = @user.id
                redirect_to user_path(@user)           
            else
                redirect_to login_path, notice: "Please enter correct login information."
            end
    end

    def destroy
        session.clear 
        redirect_to root_path
    end 

    private

    def auth
    request.env['omniauth.auth']
    end
end 
end     
