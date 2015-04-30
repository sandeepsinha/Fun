Rails.application.routes.draw do

  get 'events/show'
  get 'users/profile/:id' => 'users#profile'

  resource :users
  resource :events

  root 'users#index'

end