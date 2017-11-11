class ReserveItemsController < ApplicationController
  # Declare global instance variables2
  # public @reserve_done

  # Created Method
  def create
    @reserve = current_reserve # Get current reserve grouo
    if !@reserve.reserve_items.where(element_id: reserve_items_params[:element_id]).exists?(conditions =  :none)
      @reserve_item = @reserve.reserve_items.new(reserve_items_params) # Create a new item, based in private params function
      @reserve.save
      session[:reserve_id] = @reserve.id # Create a session with reservation id
      @element = Element.find(@reserve_item[:element_id])
      @initial_element_amount = @element.amount.to_i # Declare initial amount value of the element
      @element.update_attribute(:amount, @initial_element_amount - @reserve_item[:amount].to_i)
      # else
      # @reserve_item = @reserve.reserve_items.where(reserve_items_params[:element_id])
      # # @reserve_item.first.update_attributes(reserve_items_params)
      # @reserve_items = @reserve.reserve_items

    end



    redirect_to root_path
  end


  # Update Method
  def update
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_items.find(params[:id]) # Find a given item within current reservation by id
    @reserve_item.update_attributes(reserve_items_params) # Update given item, based in private function
    @reserve_items = @reserve.reserve_items# Get current reservation items
  end

  # Destroy Method
  def destroy
    @reserve = current_reserve # Acces to current reserve group
    @reserve_item = @reserve.reserve_items.find(params[:id]) # Find reserve item, within current reservation by id
    @element = Element.find(@reserve_item[:element_id])
    @current_amount = @element.amount.to_i # Declare initial amount value of the element
    @element.update_attribute(:amount, @current_amount + @reserve_item[:amount].to_i)
    @reserve_item.destroy # Destroy given item
    @reserve_items = @reserve.reserve_items # Save to current reservation items
    redirect_to cart

  end


  # Send Mail method
  def send_mail
    @reserve_items = current_reserve.reserve_items
    @current_user = current_user
    ReportMailer.receipt(@reserve_items, @current_user).deliver
    @reserve_items.delete_all
    redirect_to root_path
  end

  # Privates Methods Initializer
  private
  # Reserve itemps private access methods
  def reserve_items_params
    @params = params.require(:reserve_item).permit(:amount, :element_id) # Params permition changed
    return @params
  end

  # google api registration OAUTH private method
  def client_options
    {
      client_id: Rails.application.secrets.google_client_id, # Client Id from secrets config file
      client_secret: Rails.application.secrets.google_client_secret, # Client secret from secrets config file
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth', # Authentication url for google linkage
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token', # Authentication url for google linkage
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,  # Declaration of initial auth calendar service scope
      redirect_uri: callback_url # initializate callback url for service appliance (?) 
    }
  end
end
