Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :blogs do
    resources :comments

    collection do
      post :confirm
    end
  end

  #get 'contacts' => 'contacts#index'
  resources :contacts, only: [:new, :create] do
    collection do
      post :confirm
    end
  end

  root 'top#index'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
end
