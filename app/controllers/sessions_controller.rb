
class SessionsController < ApplicationController 
    
    def logged_in?
        session[:user_id] 
    end    

    def require_login
        if !logged_in?
            redirect_to login_path
        end
    end

    def new
        @user = User.new
    end

    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else 
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to login_path
    end
end