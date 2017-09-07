class Reserve < ApplicationRecord
  # Main Initial Associations
  has_many :reserve_items
  belongs_to :reserve_status

  before_validation :set_reserve_status # Invoke function on creation

  private
  # Set Reservation Status
  def set_reserve_status
    self.reserve_status_id = 1
  end


end
