class ElementsController < ApplicationController

  def index
$selected_date = $current_date
    @elements = Element.all # Access to all elements in db
    @reserve_item = current_reserve.reserve_items.new # Access to current reserve items and insert onreree
  end

  def update
    @elements = Element.all # Access to all elements in db
    $selected_date = params[:date_picker]
    @reserve_item = current_reserve.reserve_items.new # Access to current reserve items and insert onreree
    @input_date = convert_to_date(params[:date_picker])

    render  "elements/search"

  end


  private
  def convert_to_date(input)
    return input.split(" / ").join("-").to_date
  end
end
