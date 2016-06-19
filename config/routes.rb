Rails.application.routes.draw do

  root "admin/logs#index"
  get '/raw/:env' => "admin/logs#raw"

  namespace :admin do
    resources :logs
  end

end
