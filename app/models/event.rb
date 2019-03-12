class Event < ApplicationRecord
  belongs_to :series
  validates :title, presence: true

  validates :how_often, acceptance: { accept: [ 'Daily', 'Weekly', 'Monthly', 'Custom'] }
  validates :day_of_the_month, acceptance: { accept: [ '1st', '2nd', '3rd', '4th', '5th', '6th', '7th', '8th', '9th',
      '10th', '11th', '12th', '13th', '14th', '15th', '16th', '17th', '18th', '19th', '20th', '21st', '22nd', '23rd',
      '24th', '25th', '26th', '27th', '29th', '30th', '31st']}
  validates :of_the_param, acceptance: { accept: [ 'Same day', 'Next day', '2nd day', '3rd day', '4th day', '5th day', '6th day' ]}

  validates :day_of_the_week, presence: true, if: :valid_day_of_the_week?,
            unless: -> { day_of_the_week.nil? }

  def valid_day_of_the_week?
    !day_of_the_week.is_a?(Array) || wdays.detect{|d| !['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].include?(d)}
  end
end
