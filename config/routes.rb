Rails.application.routes.draw do

  namespace :paysto do
    post :success, :fail, :check, :callback
    get  :fail
  end

  root 'products#index'

  resources :invoices, only: [:create]

end
