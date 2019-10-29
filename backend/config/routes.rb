Rails.application.routes.draw do
  root :to => "users#index"

  namespace 'api', defaults: { format: :json } do
    namespace 'auth' do
      post '/sign_in', to: 'oauth#facebook'
    end

    resources :users do
      collection do
        get :search
      end
    end

  end

  get 'hoge/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
