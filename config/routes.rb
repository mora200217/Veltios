Rails.application.routes.draw do
  resources :elements, only [:index]
  resource :cart, only [:show]
  resources :reserve_items, only [:create, :update, :destroy]

  root "elements#index"

end
