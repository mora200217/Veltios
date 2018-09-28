class ElementsController < ApplicationController

  def index
  $selected_date = $current_date
    @elements = Element.all # Access to all elements in db
    @reserve_item = current_reserve.reserve_items.new # Access to current reserve items and insert onreree
  end

  private
  def convert_to_date(input)
    return input.split(" / ").join("-").to_date
  end
end
