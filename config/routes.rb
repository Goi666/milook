Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :company
  post "company/new" => "company#create"
  root "toppage#on"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # get "index/top" => "index#top"
  # get "index/new" => "index#new"
  # get "index/:id/show" => "index#show"
  # post "index/form" => "index#create"
end
