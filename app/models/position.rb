class Position < ApplicationRecord
  belongs_to :user
  def as_json(options = nil)
    {
      user: user.email,
      name: user.name,
      lat: lat,
      lng: lng
    }
  end
end
