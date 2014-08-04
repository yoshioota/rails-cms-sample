Rails.application.routes.draw do

  # resources :page_histories

  # resources :pages

  # resources :sites_members

  # resources :sites

  resources :u, only: [:index, :show] do
    scope module: :u do
      resources :articles, only: [:index, :show]
    end
  end

  get 'home' => 'home#show'
  namespace :home do

    resources :sites do
      resources :pages
    end

    resources :comments
  end

  namespace :settings do
    resource :profiles
    resource :accounts
    resource :passwords
    resource :withdrawals
  end

  devise_for :users,
      controllers: {
          registrations: 'registrations',
      }

  root 'welcome#index'

end
