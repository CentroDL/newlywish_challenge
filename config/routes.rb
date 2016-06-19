Rails.application.routes.draw do

  root "welcome#index"
  get '/raw/:env' => "welcome#raw"
end
