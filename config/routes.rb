Rails.application.routes.draw do
 
  devise_for :users
  root to: 'recipes#index'
  resources :users, only: [:index, :show] do
    resources :recipes, except: [:update] 
    resources :general_shopping_list, only: [:index]
  end
end
