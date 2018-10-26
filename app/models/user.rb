class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable
    has_many :positions
    belongs_to :family

    def self.current
      Thread.current[:user]
    end

    def self.current=(user)
      Thread.current[:user] = user
    end

    def last_known_location
      positions.limit(1)[0]
    end

end
