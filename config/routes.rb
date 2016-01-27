Rails.application.routes.draw do
	scope "/api" do
	  resources :transcripts, only: [:index]
	  resources :moments, only: [:show] do
	  	resources :transcripts, only: [:index]
	  end
	  resources :stories, only: [:index, :show]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
