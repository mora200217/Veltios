class ReserveItemsController < ApplicationController
  # Declare global instance variables2
  # public @reserve_done

  # Created Method
  def create

    @reserve = current_reserve # Get current reserve grouo
    @elements = Element.all
    if  @reserve.reserve_items.find_by(element_id: reserve_items_params[:element_id])
      update
    else
      @reserve_item = @reserve.reserve_items.create!(reserve_items_params) # Create a new item, based in private params function
      @reserve.save
      session[:reserve_id] = @reserve.id # Create a session with reservation id
      @element = Element.find(@reserve_item[:element_id])
      @initial_element_amount = @element.amount.to_i # Declare initial amount value of the element
      @element.update_attribute(:amount, @initial_element_amount - reserve_items_params[:amount].to_i)
      # render 'elements/index'
      respond_to do |format|
        format.js
      end

  end
  end


  # Update Method
def update
    @reserve = current_reserve # Acces to current reserve groupç
    @reserve_item = @reserve.reserve_items.find_by(element_id: reserve_items_params[:element_id])# Find a given item within current reservation by id
    @reserve_item.update_attribute(:amount, @reserve_item[:amount] + 1) # Update given item, based in private function
    @reserve_items = @reserve.reserve_items# Get current reservation items

    @element = Element.find(@reserve_item[:element_id])
    @initial_element_amount = @element.amount.to_i # Declare initial amount value of the element
    @element.update_attribute(:amount, @initial_element_amount - reserve_items_params[:amount].to_i)

    @elements = Element.all

      respond_to do |format|
        format.js
      end
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
    respond_to do |format|
      format.js
    end

  end



  def action_definer
    @elements = Element.all
    @reserve = current_reserve
    if @reserve.reserve_items.find_by(element_id: reserve_items_params[:element_id])
      update
    else
      create
    end

  end



  # Send Mail method
  def send_mail
    @reserve_items = current_reserve.reserve_items
    @current_user = current_user
    ReportMailer.receipt(@reserve_items, @current_user).deliver
    @reserve_items.delete_all
    redirect_to root_path
  end


  # Service Google Api redirection

  def redirect

    if current_user.admin
      client = Signet::OAuth2::Client.new(client_options) # Access to Client submodule and applied creation method - new
      redirect_to client.authorization_uri.to_s # Redirect to client OAUTH uri

    else
      redirect_to root_path
    end

  end


  # callback methods
  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]
    response = client.fetch_access_token!
    session[:authorization] = response
    redirect_to calendars_path
  end

  def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists


  end

  def new_calendar
    calendar = Google::Apis::CalendarV3::Calendar.new(calendar_options)
    result = client.insert_calendar(calendar)
  end

  # Privates Methods Initializer
  private
  # Reserve itemps private access methods
  def reserve_items_params
    @params = params.require(:reserve_item).permit(:amount, :element_id) # Params permition changed
    return @params
  end

  private
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

  def calendar_options
    {
      summary: "TEST Calendar"
    }
  end
end
