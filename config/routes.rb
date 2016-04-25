Rails.application.routes.draw do
  root 'staticpages#index'

  resources :deckcards
  resources :cards
  resources :decks
end
