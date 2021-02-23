Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:update]
  get"blog/home"
  get"blog/about"
  get"bloggers/:id/edit" , to: "bloggers#edit" , as: "edit"
  get"bloggers/everything", to: "bloggers#everything"
  post"bloggers/everything", to: "bloggers#create"
  delete"bloggers/everything", to: "bloggers#delete"
  patch"bloggers/everything.:id", to: "bloggers#update" 
  root"blog#home"
end
