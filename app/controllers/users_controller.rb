class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)

        redirect_to user_path(@user)
    end

    def show
        @user = User.find_by(params[:id])
    end

    def destroy
        session.destroy
        redirect_to '/'
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height)
    end


end


