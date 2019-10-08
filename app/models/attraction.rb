class Attraction < ApplicationRecord
    validates :name, uniqueness: true
    has_many :rides
    has_many :users, through: :rides
end
