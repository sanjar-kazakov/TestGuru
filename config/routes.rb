Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests do
    resources :questions
  end

  delete '/tests/:test_id/questions/:question_id', to: 'questions#destroy', as: 'delete_test_question'

end
