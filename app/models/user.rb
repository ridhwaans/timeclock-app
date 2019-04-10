class User < ActiveRecord::Base
  has_many :clock_events
  has_many :clocks, through: :clock_events

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create 
end