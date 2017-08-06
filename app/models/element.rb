class Element < ApplicationRecord
  # Accesible attributes for Element Registers
    attr_accesible :amount, :available

  # Main Initaial Associations
  has_many :reserve_items

  default scope {where(active: true)}
end
