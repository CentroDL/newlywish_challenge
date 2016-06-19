Rails.application.routes.draw do

  namespace :admin do
    resources :logs
  end

  root "admin/logs#index"
  get '/raw/:env' => "admin/logs#raw"


end
