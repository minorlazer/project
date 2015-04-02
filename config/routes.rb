Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'products#index'

  get 'pages/about' => 'abouts#about'

  get 'pages/contact' => 'contacts#contact'

  match '/' => 'products#search', :as => 'search_results', :via => :post

  get 'products/:id' => 'products#show', :as => 'product', id: /\d+/

  #get 'pages/payment' => 'payments#payment', :as => 'payments'
end
