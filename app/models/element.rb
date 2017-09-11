class Element < ApplicationRecord
  # Accesible attributes for Element Registers
  # attr_accesible :amount, :available

  # Main Initaial Associations
  has_many :reserve_items
  has_attached_file :preview, styles: { medium: "300x300>", thumb: "100x100>" } # , default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :preview, content_type: /\Aimage\/.*\z/

  # Define Initial Scope
  default_scope {where(available: true)}
end
