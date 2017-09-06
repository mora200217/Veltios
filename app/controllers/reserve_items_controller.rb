class ReserveItemsController < ApplicationController
# Declare global instance variables


  # Created Method
  def create

      @reserve = current_reserve # Get current reserve grouo
      @reserve_item = @reserve.reserve_items.new(reserve_items_params) # Create a new item, based in private params function
      @element = Element.find(@reserve_item[:element_id])
      @initial_element_amount = @element.amount.to_i # Declare initial amount value of the element
      @element.update_attribute(:amount, @initial_element_amount - @reserve_item[:amount].to_i)
      # @reserve.save # Save insertion in current reservation
      session[:reserve_id] = @reserve.id # Create a session with reservation id
      @reserve.save!
      @current_elements = Element.all # Access to all elements in db


  end

  # Update Method
  def update
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_items.find(params[:id]) # Find a given item within current reservation by id
    @reserve_item.update_attributes!(reserve_items_params) # Update given item, based in private function
    @reserve_items = @reserve.reserve_items# Get current reservation items
  end

  # Destroy Method
  def destroy
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_items.find(params[:id]) # Find reserve item, within current reservation by id
    @element = Element.find(@reserve_item[:element_id])
    @current_amount = @element.amount.to_i # Declare initial amount value of the element
    @element.update_attribute(:amount, @current_amount + @reserve_item[:amount].to_i)
    @reserve_item.destroy # Destroy given item
    @reserve_items = @reserve.reserve_items # Save to current reservation items

  end

  # Privates Methods Initializer
  private
  def reserve_items_params
    params.require(:reserve_item).permit(:amount, :element_id) # Params permition changed

  end
end
