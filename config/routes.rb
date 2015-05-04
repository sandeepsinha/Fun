Rails.application.routes.draw do
  get 'users/new' => 'users#new' , :as => :user
  get 'users/:id/profile' => 'users#profile'
  get 'users/:id/edit' => 'users#edit'
  get 'events/show' => 'users#show'

  resource :users
  resource :events
  root 'users#index'

end
