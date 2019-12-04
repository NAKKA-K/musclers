Rails.application.routes.draw do
  root :to => "users#index"

  # HACK: mock
  namespace :mock, defaults: { format: :json } do
    scope :api do
      scope :user do
        resources :direct_message_groups, only: [:show] do
          post '/', to: 'direct_message_groups#create'
        end

        resources :information, only: [:index]

        get '/joined_groups', to: 'joined_groups#index'
      end

      resources :groups, only: [:index, :show, :create] do
        get '/messages', to: 'group_messages#show'
      end

      resources :blogs, only: [:index, :show]
    end
  end

  namespace 'api', defaults: { format: :json } do
    namespace 'auth' do
      post '/sign_in', to: 'oauth#facebook'

      get '/user', to: 'user#myself'
    end

    resources :users do
      member do
        patch :edit
      end

      collection do
        get :recommended_users
      end
    end

    resources :tags

    resources :blogs

    scope :user do
      resources :information, only: [:index]

      resources :direct_message_groups,only: [:index]
    end

    resources :groups, only: [:index] do
      member do
        post :join
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
