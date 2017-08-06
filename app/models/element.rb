class Element < ApplicationRecord
  # Accesible attributes for Element Registers
    # attr_accesible :amount, :available

  # Main Initaial Associations
  has_many :reserve_items

  # Define Initial Scope
  default_scope {where(available: true)}
end
