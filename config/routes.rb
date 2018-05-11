Rails.application.routes.draw do
  root 'welcome#index'

  get 'profile', to: 'profile#index'

  get 'repos', to: 'repos#index'
  get 'followers', to: 'followers#index'
  get 'following', to: 'following#index'
  get 'starred', to: 'starred#index'

  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
