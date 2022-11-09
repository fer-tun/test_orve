Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   get "/home", to: 'home#index'
   get "/export", to: 'export#index'
   get "/import", to: 'import#index'
   post "/importdata", to: 'import#read_file'
   get "/list", to: 'sales#index'
end
