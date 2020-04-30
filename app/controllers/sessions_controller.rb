class SessionsController < ApplicationController
    def home
    if is_logged_in? 
      redirect_to user_path(current_user)
    else
      render :home
    end
  end 

  def new
    @user = User.new
  end 
   
  def create 
      if auth
            @user = User.find_or_create_by(email: auth['info']['email'])
            @user.password = SecureRandom.hex
            @user.name = auth['info']['name']
            if @user.save
                session[:user_id] = @user.id
                redirect_to @user
            else
                redirect_to root_path
            end
        else
            @user = User.find_by(email: params[:user][:email])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to @user            
            else
                redirect_to login_path, notice: "Please enter a correct username and password"
            end
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
