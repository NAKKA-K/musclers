Rails.application.routes.draw do
  root :to => "users#index"

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
        get :search
      end
    end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
