Rails.application.routes.draw do
  root 'home#index'
  get 'catamaran' => 'home#catamaran'
  get 'gallery' => 'home#gallery'

  resources :reservations, only: [:new, :create]
end
