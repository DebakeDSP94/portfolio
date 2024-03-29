Rails.application.routes.draw do
  resources :topics, only: [:index, :show]


  resources :blogs do
    resources :comments, module: :blogs, only: %i[index create]
  end

  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users, path: '',
                path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                sign_up: 'register'
                            }

  resources :portfolios, except: [:show]

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  get root to: 'pages#home'
end
