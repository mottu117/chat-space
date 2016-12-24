Rails.application.routes.draw do
  root 'messeges#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :groups, only: [:edit, :update, :new, :create] do
    resources :messeges, only: [:index, :new]
  end

end
