class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :instrument

  validate :validate_date_in_present, :validate_date_smaller_than_end_date
  validates :user_id, :instrument_id, :start_date, :end_date, presence: true
  validates :instrument_id, uniqueness: { scope: :start_date}

  def validate_date_in_present
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Please chose a start date that is in the present!")
    end
  end

  def validate_date_smaller_than_end_date
    if start_date.present? && start_date > end_date
      errors.add(:start_date, "Start date needs to be before end date!")
    end
  end

end
