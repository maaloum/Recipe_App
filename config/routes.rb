Rails.application.routes.draw do
 
  devise_for :users
  root to: 'recipes#index'
  resources :users, only: [:index, :show] do
    resources :foods, except: [:update] 
    resources :recipes, except: [:update] 
    resources :general_shopping_list, only: [:index]
  end
  resources :public_recipes, only: [:index]
end
