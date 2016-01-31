Rails.application.routes.draw do
	scope "/api" do
    resources :stories
	  resources :transcripts, only: [:index]
	  resources :moments do
      resources :transcripts, only: [:index]
      member do
        get :audio, to: :audio
      end
	  end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
