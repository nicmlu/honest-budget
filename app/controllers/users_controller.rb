class UsersController < ApplicationController
    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new 
        end 
    end 

    def show
        redirect_if_not_logged_in
        @user = current_user
        redirect_to '/' if !@user
    end 

    def destroy
    end
    


end
