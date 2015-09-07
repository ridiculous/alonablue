Rails.application.routes.draw do
  root 'home#index'
  get 'catamaran' => 'home#catamaran'
  get 'gallery' => 'home#gallery'
  get 'contact' => 'reservations#new'
  resources :reservations, only: [:new, :create]
end
