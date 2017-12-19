class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_reserve  # Helper Method created
  before_action :authenticate_user!


  # Current Reservation function
  def current_reserve
    # Public Variables Initial OVerall Declaration
    @elements = Element.all
    @reserves_done = Array.new
    @current_date = Time.now.strftime("%d / %b / %Y")
    @default_date = true # 
    @selected_date = Time.now # Without date formating

    # require/

    if !session[:reserve_id].nil? # Check for Reservation session existance
      Reserve.find(session[:reserve_id])  # Find reservation session
    else
      Reserve.new # Else, create new Reservation
    end

  end

  def change_date
    @selected_date = params[:date_picker].nil? ? 1 : params[:date_picker]
  end

end
