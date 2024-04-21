Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions, only: %i[index show new create destroy], shallow: true
  end
end
