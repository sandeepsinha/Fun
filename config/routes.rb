Rails.application.routes.draw do

  get 'users/login' => 'users#login'
  get 'users/dashboard' => 'users#dashboard'
  post 'users/validate'
  get 'users/new' => 'users#new' , :as => :user
  get 'users/profile' => 'users#profile'
  get 'users/edit' => 'users#edit'
  get 'events/new' => 'events#new' , :as => :event
  get 'events/list' => 'events#list'
  get 'events/show' => 'events#show'
  get 'events/upcoming' => 'events#upcoming'
  get 'events/past' => 'evens#past'

  resource :users
  resource :events
  root 'users#login'

end
