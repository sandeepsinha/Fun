Rails.application.routes.draw do

  get 'users/login' => 'users#login'
  get 'users/dashboard' => 'users#dashboard'
  post 'users/validate'
  get 'users/profile' => 'users#profile'
  get 'users/edit' => 'users#edit'
  post 'users/change_password' => 'users#change_password'
  get 'events/new' => 'events#new' , :as => :event
  get 'events/list' => 'events#list'
  get 'events/:id' => 'events#show'
  get 'events/upcoming' => 'events#upcoming'
  get 'events/past' => 'evens#past'

  resource :users
  resource :events
  root 'users#index'

end
