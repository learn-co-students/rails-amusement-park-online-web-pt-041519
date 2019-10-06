class User < ActiveRecord::Base
   has_secure_password
   validates :name, presence: true
   validates :password_digest, presence: true


   has_many :rides
   has_many :attractions, through: :rides

   def mood
      if !self.happiness.nil? && !self.nausea.nil?
          self.happiness > self.nausea ? "happy" : "sad"
      end            
   end

end
