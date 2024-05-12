Rails.application.routes.draw do

  root to: 'tests#index'

  get 'sessions/new'
  get 'users/new'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, except: %i[index destroy] do
      resources :answers, except: :index
    end

    member do
      post :start
    end
  end

  resources :user_answers, only: %i[show update] do
    member do
      get :result
    end
  end

  delete '/tests/:test_id/questions/:question_id', to: 'questions#destroy', as: 'delete_test_question'

end
