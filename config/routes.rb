Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get"blog/home"
  get"blog/about"
  get"bloggers/everything", to: "bloggers#everything"
  post"bloggers/everything", to: "bloggers#create"
  root"blog#home"
end
