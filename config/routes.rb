Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :messeges, only: [:show, :new]
  resources :groups, only: [:index, :edit, :update, :new, :create]

end
