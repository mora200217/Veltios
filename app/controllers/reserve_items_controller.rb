class ReserveItemsController < ApplicationController
  # Created Method
  def create
    @reserve = current_reserve # Get current reserve group
    @reserve_item = @reserve.reserve_items.new(reserve_items_params) # Create a new item, based in private params function
    @reserve.save # Save insertion in current reservation
    session[:reserve_id] = @reserve.id # Create a session with reservation id
  end

  # Update Method
  def update
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_item.find(params[:id]) # Find a given item within current reservation by id
    @reserve_item.update_attribute(reserve_items_params) # Update given item, based in private function
    @reserve_items = @reserve.reserve_items # Get current reservation items
  end

  # Destroy Method
  def destroy
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_item.find(params[:id]) # Find reserve item, within current reservation by id
    @reserve_item.destroy # Destroy given item
    @reserve_items = @reserve.reserve_items # Save to current reservation items
  end

  # Privates Methods Initializer
  private
  def reserve_items_params
    params.require(:reserve_item).permit(:amount, :element_id) # Params permition changed
  end
end
