class User < ApplicationRecord
    has_many :events, foreign_key: 'user_id', class_name: 'Event'
    has_many :attendances
    has_many :attended_events, through: :attendances, source: :event
  
    validates :email, presence: true, uniqueness: true
    validates :encrypted_password, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
  end
  