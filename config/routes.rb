Rails.application.routes.draw do


  #если прописывать для каждого
  ###post '/questions', to: 'questions#create'
  ###patch '/questions/:id', to: 'questions#update'
  ###delete '/questions/:id', to: 'questions#destroy'

  root to: "questions#index"
  resources :questions
  resources :users, only: %i[new create]
end
