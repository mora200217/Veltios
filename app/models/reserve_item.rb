class ReserveItem < ApplicationRecord
  # Main Initial Associations
  belongs_to :element
  belongs_to :reserve

  # Function Element Present
  def element_present
    # Check for Element Existance
    if element.nil?
      errors.add(:element, "Is not a valid element or is inactive") # Display Erros Message
    end
  end
end
