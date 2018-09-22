class ReserveActionsController < ApplicationController
  def destroy_all
   @reserve_items = current_reserve.reserve_items
   @elements = Element.all
   @reserve_items.each do |item|
     @selected_element = @elements.find(item[:element_id])
     @selected_element.update_attribute(:amount, @selected_element.amount.to_i + item.amount.to_i )
   end
    @reserve_items.destroy_all


  end

end
