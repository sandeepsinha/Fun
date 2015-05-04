Rails.application.routes.draw do
  get 'users/new' => 'users#new' , :as => :user
  get 'users/:id/profile' => 'users#profile'
  get 'users/:id/edit' => 'users#edit'
  get 'events/index' => 'events#index'
  get 'events/show' => 'events#show'

  resource :users
  resource :events
  root 'users#index'

end
