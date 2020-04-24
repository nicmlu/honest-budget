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
    if user_params[:email]
      @user = User.find_by(email: user_params[:email])
      if @user && @user.authenticate(user_params[:password])
        log_in(@user)
      else 
        flash[:alert] = "Please enter correct login information."
        redirect_to login_path
      end 
    else 
      if @user = User.find_by(email: auth[:info][:email])
        log_in(@user)
      else 
        @user = User.new(name: auth[:info][:name], email: auth[:info][:email], password: SecureRandom.hex)
        if @user.save
          log_in(@user)
        else 
          flash[:alert] = "Please enter correct login information."
          redirect_to login_path
        end 
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
