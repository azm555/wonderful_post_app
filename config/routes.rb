Rails.application.routes.draw do
  get 'mypages/show'
  get '/mypage' , to: 'mypages#show'
  devise_for :users
  # get 'articles/index'
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
