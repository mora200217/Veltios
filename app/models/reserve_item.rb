class ReserveItem < ApplicationRecord
  belongs_to :element
  belongs_to :order
end
