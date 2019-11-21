class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  def mood
    if happiness && nausea
      if happiness >= nausea
        "happy"
      else
        "sad"
      end
    else
      "unknown"
    end
  end
end
