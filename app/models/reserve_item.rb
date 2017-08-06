class ReserveItem < ApplicationRecord
  # Main Initial Associations
  belongs_to :element
  belongs_to :reserve

  # Initial Validations
  validate :element_present
  validate :reserve_present

  # Invoke function before saving
  before_save :finalize

  # Function Element Present
  private
  def element_present
    # Check for Element Existance
    if element.nil?
      errors.add(:element, "Is not a valid element or is inactive") # Display Errors Message
    end
  end

   # Function Reservation Present
   def reserve_present
  # Check for Reservation Existance
    if reserve.nil? # Check for reserve type nil?
      errors.add(:reserve, "Its not a valid reservation") # Display Errors Message
    end
   end

# Finalize function
   def finalize
     self[:amount] = amount
   end
end
