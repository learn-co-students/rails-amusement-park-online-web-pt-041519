class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    message = "Sorry."

    # Check tickets
    message = message + " You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets

    # Check height
    message = message + " You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height

    # Update user stats if they can ride
    if message.length > 6 
      return message
    else
      # Tickets
      self.user.tickets -= self.attraction.tickets
      
      # Nausea
      self.user.nausea += self.attraction.nausea_rating

      # Happiness
      self.user.happiness += self.attraction.happiness_rating

      self.user.save
    end
  end
end
