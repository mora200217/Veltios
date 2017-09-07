Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :elements, only: [:index]
  resource :cart, only: [:show]
  resources :reserve_items, only: [:create, :update, :destroy]

  post "send_mail" => "reserve_items#send_mail"

  root "elements#index"

end
