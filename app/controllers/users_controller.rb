class UsersController < ApplicationController


    

    def create
        @user = User.new(params[:username])
        @user.password = params[:password]
       
        if @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to login_path
        end
    end
end
