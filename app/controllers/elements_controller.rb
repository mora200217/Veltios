class ElementsController < ApplicationController

  def index
    @current_elements = Element.all # Access to all elements in db
    @reserve_item = current_reserve.reserve_items.new # Access to current reserve items and insert one
  end

end
