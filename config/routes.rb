Rails.application.routes.draw do
  devise_for :users

  post "users/logout" => "users#logout"
  post "users/:id/update" => "users#update"
  get "users/edit" => "users#edit"
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#login'
  post 'users/create' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/again' => 'users#again'
  get "users/:id/new" => "users#new"
  
  post 'guesthouses/create' => 'guesthouses#create'
  get 'guesthouses/:id/top' => 'guesthouses#top'
  get 'guesthouses/top' => 'guesthouses#top'
  post 'guesthouses/recruit' => 'guesthouses#recruit'
  get 'guesthouses/recruit' => 'guesthouses#recruit'
  get 'guesthouses' => 'guesthouses#top'
  get '/' => 'home#top'
 
end
