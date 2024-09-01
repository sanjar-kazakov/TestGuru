Rails.application.routes.draw do

  root to: 'tests#index'

  devise_for :users,  path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :user_answers, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      patch :publish, on: :member

      resources :questions do
        resources :answers
      end
    end
    resources :gists, only: %i[index]
    resources :badges
  end

  resources :contact_forms, only: %i[new create]
  resources :gists, only: %i[create]
  resources :badges, only: %i[index]

end
