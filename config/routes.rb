Rails.application.routes.draw do
  devise_for :users
  post 'users/:id/update' => 'users#update'
  get "users/:id/edit" => "users#edit"
  post 'users/login' => 'users#login'
  post 'users/create' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/again' => 'users#again'
  
  get 'guesthouses/top' => 'guesthouses#top'
  get '/' => 'home#top'
 
end
