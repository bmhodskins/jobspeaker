class Event < ApplicationRecord
  belongs_to :series
  validates :title, presence: true


end
