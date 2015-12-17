Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"

  resources :tickets do
    member do
      resource :comment
    end
  end

end
