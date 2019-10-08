class AttractionsController < ApplicationController

    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = User.find_by(id: session[:user_id])
        if @user.admin != true
            if @user.height > @attraction.min_height && @user.tickets > @attraction.tickets
                flash[:alert] = "Thanks for riding the #{@attraction.name}!"
                @user.tickets = @user.tickets - @attraction.tickets
                @user.happiness = @user.happiness + @attraction.happiness_rating
                @user.nausea = @user.nausea + @attraction.nausea_rating
                @user.save
            elsif @user.height < @attraction.min_height && @user.tickets > @attraction.tickets
                flash[:alert] = "You are not tall enough to ride the #{@attraction.name}"
            elsif @user.tickets < @attraction.tickets && @user.height > @attraction.min_height
                flash[:alert] = "You do not have enough tickets to ride the #{@attraction.name}"
            elsif @user.height < @attraction.min_height && @user.tickets < @attraction.tickets
                flash[:alert] = "You are not tall enough to ride the #{@attraction.name}. You do not have enough tickets to ride the #{@attraction.name}"
            end
        end
    end

    def index
        @attractions = Attraction.all
        @user = User.find_by(id: session[:user_id])
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save
            redirect_to attraction_path(@attraction)
        else
            render :new
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        @attraction = Attraction.find_by(id: params[:id])
        @attraction.update(name: params[:attraction][:name], tickets: params[:attraction][:tickets], nausea_rating: params[:attraction][:nausea_rating], min_height: params[:attraction][:min_height], happiness_rating: params[:attraction][:happiness_rating])
        redirect_to attraction_path(@attraction)
    end


    
    private
    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :min_height, :happiness_rating)
    end



end
