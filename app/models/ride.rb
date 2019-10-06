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
         update_tickets && update_nausea && update_happiness
         "Thanks for riding the #{attraction.name}!"
      end
   end


   private

   # method to determine if user does not have enough tickets 
   def ticket_count
      self.user.tickets < self.attraction.tickets
   end

   # method to update ticket count
   def update_tickets
      new_ticket_count = self.user.tickets - self.attraction.tickets
      self.user.tickets = new_ticket_count
      self.user.save
   end

   # method to determine if user is not tall enough
   def tall_enough?
      self.user.height < self.attraction.min_height
   end

   # method to update user nausea
   def update_nausea
      updated_nausea = self.user.nausea + self.attraction.nausea_rating
      self.user.nausea = updated_nausea
      self.user.save
   end

   # method to update user happiness
   def update_happiness
      updated_happiness = self.user.happiness + self.attraction.happiness_rating
      self.user.happiness = updated_happiness
      self.user.save
   end

   # method to determine is user is tall enough and has enough tickets
   def ticket_count_and_tall_enough?
      ticket_count && tall_enough?
   end

end
