class CartsController < ApplicationController
  def show
    @reserve_items = current_reserve.reserve_items # Get reserve items of current session 
  end
end
