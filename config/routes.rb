Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :elements, only: [:index]
  resource :cart, only: [:show]
  resources :reserve_items, only: [:create, :update, :destroy]

  post "send_mail" => "reserve_items#send_mail"



  get  "reservation_date" => "elements#update"
  get "search" => "application#search"


  post "/update_reservation" => "elements#update"

 patch "/reserve_items" => "reserve_items#update"

  root "elements#index"

# Routes for google api authorization methods
  get '/redirect', to: 'reserve_items#redirect', as: 'redirect'
  get '/callback', to: 'reserve_items#callback', as: 'callback'

#Routes for calendars display
  get '/calendars', to: 'reserve_items#calendars', as: 'calendars'


end
