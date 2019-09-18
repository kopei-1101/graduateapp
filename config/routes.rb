Rails.application.routes.draw do
  devise_for :users

  post "users/logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post 'users/login' => 'users#login'
  post 'users/create' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/again' => 'users#again'
  get "users/:id/new" => "users#new"
  
  get 'guesthouses/top' => 'guesthouses#top'
  get 'guesthouses/recruit' => 'guesthouses#recruit'
  get 'guesthouses' => 'guesthouses#top'
  get '/' => 'home#top'
 
end
