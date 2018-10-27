class Position < ApplicationRecord
  include ActionView::Helpers::DateHelper
  belongs_to :user
  def as_json(options = nil)
    {
      user: user.email,
      name: user.name,
      lat: lat,
      lng: lng,
      created_at: time_ago_in_words(created_at)
    }
  end
end
