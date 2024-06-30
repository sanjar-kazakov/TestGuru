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

      resources :questions do
        resources :answers
      end
    end
    resources :gists, only: %i[index]
  end

  resources :gists, only: %i[create]

end
