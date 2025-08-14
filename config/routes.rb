Rails.application.routes.draw do
  root 'products#index'
  get 'unsubscribe', to: 'subscriptions#unsubscribe', as: :unsubscribe
  resource :session
  resources :passwords, param: :token
  resources :products do
    resources :subscribers, only: [ :create ]
    resources :unsubscribe, only: [ :show ]
  end
end

