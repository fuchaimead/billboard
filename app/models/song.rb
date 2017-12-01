class Song < ApplicationRecord
  belongs_to :chart
  has_one :artist
end
