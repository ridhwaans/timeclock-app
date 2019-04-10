Rails.application.routes.draw do
  root to: 'clock_events#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :clock_events, except: [:destroy] do
    member do
      get 'clock_in', to: 'clocks#clock_in'
      get 'clock_out', to: 'clocks#clock_out'
    end
  end

  resources :clock_events, except: [:destroy] do
    member do
      post :clock_in
      post :clock_out
    end
  end

  resources :users, except: [:destroy]

end
