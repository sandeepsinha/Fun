Rails.application.routes.draw do

  get 'users/login' => 'users#login'
  get 'users/dashboard' => 'users#dashboard'
  post 'users/validate'
  get 'users/new' => 'users#new' , :as => :user
  get 'users/profile' => 'users#profile'
  get 'users/edit' => 'users#edit'
  get 'events/index' => 'events#index'
  get 'events/show' => 'events#show'

  resource :users
  resource :events
  root 'users#login'

end
