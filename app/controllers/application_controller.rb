class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_reserve  # Helper Method created
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  # Current Reservation function
  def current_reserve
    # Public Variables Initial OVerall Declaration
    @@elements = Element.all
    @reserves_done = Array.new
    $current_date  = Time.now.strftime("%d / %b / %Y")
    # $select_date_status = false
    $default_date= true # 
    $q= Element.ransack(params[:q])
    # require/

    if !session[:reserve_id].nil? # Check for Reservation session existance
      Reserve.find(session[:reserve_id])  # Find reservation session
    else
      Reserve.create!# Else, create new Reservation
    end

  end



  def search
    # $q= Element.ransack(params[:q])
    @search_elements= $q.result(distinct: true)
    @reserve_item = current_reserve.reserve_items.create! # Access to current reserve items and insert onreree
    render :template => "elements/index"
  end

end
