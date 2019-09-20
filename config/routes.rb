Rails.application.routes.draw do
  devise_for :users

  post "users/:id/update" => "users#update"
  get "users/edit" => "users#edit"
  post 'users/create' => 'users#create'
  get 'users/new' => 'users#new'
  get 'users/again' => 'users#again'
  
  post 'guesthouses/create' => 'guesthouses#create'
  get 'guesthouses/:id/top' => 'guesthouses#top'
  get 'guesthouses/top' => 'guesthouses#top'
  post 'guesthouses/recruit' => 'guesthouses#recruit'
  get 'guesthouses/recruit' => 'guesthouses#recruit'
  get 'guesthouses' => 'guesthouses#top'
  get '/' => 'home#top'
 
  resources :books, except: [:index, :show]
end
