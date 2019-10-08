class SessionsController < ApplicationController

    def new
        
    end

    def create
        @user = User.find_by(name: params[:user_name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:danger] = "Improper credentials given"
            redirect_to signin_path
        end

    end

    def index
    end

    def destroy
        session.clear
        redirect_to '/'
    end
    


    private
    
    def session_params
        params.require(:user).permit(:name, :password)
    end
    
    
end
