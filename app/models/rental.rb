class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validate :validate_date_in_present, :validate_date_smaller_than_end_date
  validates :user_id, :instrument_id, :start_date, :end_date, presence: true
  validates :start_date, uniqueness: { scope: :instrument, message: "Instrument already taken!" }

     # Return a scope for all rental overlapping the given rental, including the given rental itself
  #named_scope :overlapping, lambda { |rental| {
  #  :conditions => ["id <> ? AND (DATEDIFF(start_date, ?) * DATEDIFF(?, end_date)) >= 0", rental.id, rental.end_date, rental.start_date]
  #}}

  def validate_date_in_present
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Please chose a start date that is in the present!")
    end
  end

  def validate_date_smaller_than_end_date
    if start_date.present? && start_date > end_date
      errors.add(:end_date, "Start date needs to be before end date!")
    end
  end

end
