Rails.application.routes.draw do
  get 'datechooser/select'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :elements, only: [:index]
  resource :cart, only: [:show]
  resources :reserve_items, only: [:create, :update, :destroy]

  resources :reserve_actions do
    delete :destroy_all, on: :collection
    # or you may prefer to call this route on: :member
  end

  post "send_mail" => "reserve_items#send_mail"




  get "search" => "application#search"

  # get "/reserve_date" => "datechooser#select"

  post "/update_reservation" => "elements#index"

  patch "/reserve_items" => "reserve_items#action_definer"


  root "elements#index", defaults: {date: Time.now}


# Routes for google api authorization methods
  get '/redirect', to: 'reserve_items#redirect', as: 'redirect'
  get '/callback', to: 'reserve_items#callback', as: 'callback'

#Routes for calendars display
  get '/calendars', to: 'reserve_items#calendars', as: 'calendars'


end
