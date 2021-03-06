Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"

  get "ticket/:id/mail/:email", to: "tickets#show", as: "email_ticket"
  get "edit_ticket/:id/mail/:email", to: "tickets#edit", as: "edit_email_ticket"
  resources :tickets do
    member do
      resource :comment
      get "load_next_comments", to: "comments#get_next_ticket_comments", as: "get_next_ticket_comments"
      get "load_next_history", to: "tickets#get_next_ticket_history", as: "get_next_ticket_history"
    end
  end

end
