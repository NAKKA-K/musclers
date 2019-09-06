Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'api/omni_auth' }

  namespace 'api' do
    resources :users do
      collection do
        get :search
      end
    end
  end
  get 'hoge/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
