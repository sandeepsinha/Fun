Rails.application.routes.draw do

  get 'users/login' => 'users#login'
  post 'users/validate'
  get 'users/new' => 'users#new' , :as => :user
  get 'users/profile' => 'users#profile'
  get 'users/:id/edit' => 'users#edit'
  get 'events/show'

  resource :users
  resource :events
  root 'users#login'

end
