class Series < ApplicationRecord
  has_many :events, dependent: :destroy
  validates :title, presence: true
end
