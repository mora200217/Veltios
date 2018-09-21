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
    @reservation_diff_general = ReservationDifference.all
    @reservation_diff = []

    @reservation_diff_general.each do |diff|
        if diff.reservation_date.to_date == @input_date
          @reservation_diff << diff
        end
    end

    @reservation_diff.each do |diff|
      @elements.each do |element|
        if element.id == diff.element_id
          element.amount = element.amount - diff.reservation_amount
        end
      end
    end

    render  "elements/index"

  end


  private
  def convert_to_date(input)
    return input.split(" / ").join("-").to_date
  end
end
