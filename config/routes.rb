Rails.application.routes.draw do

  root "logs#index"
  get '/raw/:env' => "logs#raw"
end
