class User < ActiveRecord::Base
  has_secure_password
  
  has_many :rides
  has_many :attractions, through: :rides

  validates :name, presence: true
  validates :password_digest, presence: true, on: :create

  validates :admin, inclusion: { in: [true, false], message: "Must be true or false."  }

  # Return mood based on nausea:happiness ratio
  def mood
    if self.nausea && self.happiness
      self.nausea > self.happiness ? (return "sad") : (return "happy")
    end
  end

end
