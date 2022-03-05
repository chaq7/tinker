Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get 'weather_forecast/index'
  get 'user/profiles/edit', to: 'user_profiles#edit'
  put 'user/profiles/update', to: 'user_profiles#update'
end
