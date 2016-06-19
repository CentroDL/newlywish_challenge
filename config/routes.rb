Rails.application.routes.draw do

  #spaced for eventual lockdown
  namespace :admin do
    resources :logs
  end

  #these would never be live routes
  root "admin/logs#index"
  get 'admin/logs/raw/:env' => "admin/logs#raw"


end
