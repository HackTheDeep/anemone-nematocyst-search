Rails.application.routes.draw do
  root 'main#index'

  get '/search' => 'main#search'
  get '/features' => 'main#features'
end
