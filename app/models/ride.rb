class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride 
        if ticket_count_and_tall_enough?
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif tall_enough?
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        elsif ticket_count
            "Sorry. You do not have enough tickets to ride the #{attraction.name}." 
        else
            update_ticket && update_nausea && update_happiness
            "Thanks for riding the #{attraction.name}!"
        end  
    end

    private
    
        def update_ticket #updates ticket number
            new_ticket_count = self.user.tickets - self.attraction.tickets
            self.user.tickets = new_ticket_count
            self.user.save
        end

        def update_nausea #updates the user's nausea
            new_nausea_count = self.user.nausea + self.attraction.nausea_rating
            self.user.nausea = new_nausea_count
            self.user.save
        end

        def update_happiness #updates the user's happiness
            new_happines_count = self.user.happiness + self.attraction.happiness_rating
            self.user.happiness = new_happines_count
            self.user.save
        end

        def ticket_count #accounts for the user not having enough tickets
            self.user.tickets < self.attraction.tickets 
        end

        def tall_enough? #accounts for the user not being tall enough
            self.user.height < self.attraction.min_height
        end

        def ticket_count_and_tall_enough? #accounts for the user not being tall enough and not having enough ticket
            ticket_count && tall_enough? 
        end

end
