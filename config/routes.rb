Rails.application.routes.draw do
  root 'staticpages#index'

  resources :cards
end
