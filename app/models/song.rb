class Song < ApplicationRecord
  belongs_to :chart
  belongs_to :artist
end
