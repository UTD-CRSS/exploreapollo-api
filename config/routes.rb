Rails.application.routes.draw do
  resources :transcripts, only: [:index]
  resources :moments, only: [:index, :show]
  resources :stories, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
