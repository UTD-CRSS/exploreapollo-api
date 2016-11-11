Rails.application.routes.draw do

  scope "/api" do
    resources :media
    resources :media_attachments
    resources :metrics
    resources :missions
    resources :people
    resources :audio_segments
    resources :channels do
      resources :metrics, only: [:index]
      resources :transcripts, only: [:index]
    end
    resources :transcript_items
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
      end
	  end
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
