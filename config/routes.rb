Rails.application.routes.draw do

  scope "/api" do
    resources :media
    resources :media_attachments
    resources :metrics
    resources :missions do
      resources :tapes do
        resources :multi_channels do
          resource :transcribers
        end
      end
    end
    resources :people
    resources :audio_segments
    resources :channels do
      resources :metrics, only: [:index]
      resources :transcripts, only: [:index]
    end
    resources :transcript_items do
      collection do
        match 'search' => 'transcript_items#search', via: [:get, :post], as: :search
      end
    end
    resources :stories
	  resources :transcripts, only: [:index]
	  resources :moments do
      resources :metrics, only: [:index]
      resources :transcripts, only: [:index]
      member do
        get :audio, to: :audio
      end
      collection do
        get "random"
        match 'search' => 'moments#search', via: [:get, :post], as: :search
      end
	  end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'

  root 'stories#index'
end