Rails.application.routes.draw do
  resources :ducks, only: [:index, :show, :create, :new, :edit, :update]
  resources :students, only: [:index, :show, :create, :new, :edit, :update]
end
