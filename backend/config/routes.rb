Rails.application.routes.draw do
  root :to => "users#index"

  # HACK: mock
  namespace :mock, defaults: { format: :json } do
    scope :api do
      scope :user do
        resources :direct_message_groups, only: [:index]
      end
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
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
