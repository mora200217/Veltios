class ElementsController < ApplicationController

  def index
  $selected_date =params[:date_picker]
  @elements = Element.all
  @elements_clone = update_amounts_day
  @reserve_item = current_reserve.reserve_items.new # Access to current reserve items and insert onreree

  end

  private
  def convert_to_date(input)
    return input.split(" / ").join("-").to_date
  end



  def update_amounts_day

    @elements_clone = Element.all.to_a.map(&:serializable_hash)
    @days_updates = ReservationDifference.all # Acces to date changes updates


      @days_updates.each do |day_element|
          @reserve_day = day_element.date
          @converted_date = convert_to_num_date($selected_date)
            if  @converted_date == @reserve_day.to_s
              @temp_element = @elements_clone.select {|e| e[:id] == day_element.element_id.to_i}
              @change_amount = day_element.amount
              # @temp_element[:amount] = @temp_element[:amount].to_i - @change_amount.to_i
              # @temp_element.amount = 69
            end
      end


    return @elements_clone
  end

  def convert_to_num_date(input_date)
    new_array = []
    months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    begin
      input_date.split("-").each do |component|
              if component.to_i == 0
                counter = 1
                months.each do |mont|
                    if component.to_s == mont
                        component = counter
                    end
                counter = counter + 1
                end
              end
          new_array << component
      end

      return new_array.reverse.join("-").to_s
    rescue NoMethodError
      redirect_to root_path
    end

  end
end
