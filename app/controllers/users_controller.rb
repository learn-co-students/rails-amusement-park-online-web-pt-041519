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
        if !logged_in?
            redirect_to '/'
        else
            @user = User.find(params[:id])
            
            if @user.admin == true
                @admin_status = "ADMIN"
            else
                @admin_status = ""
            end
        end

    end

    def index
    end

    def welcome
    end
    
    def update
    end
    



    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end



end
