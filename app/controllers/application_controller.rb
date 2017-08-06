class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_reserve  # Helper Method created

  # Current Reservation function
  def current_reserve
    if !session[:order_id].nil? # Check for Reservation session existance
      Reserve.find(session[:order_id])  # Find reservation session
    else
      Reserve.new # Else, create new Reservation 
    end

  end

end
