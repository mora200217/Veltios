Rails.application.routes.draw do
  get 'reserve_items/create'

  get 'reserve_items/update'

  get 'reserve_items/destroy'

  get 'carts/show'

  get 'elements/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
