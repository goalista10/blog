Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:update] 

  

  get"blog/home"
  get"blog/about"
  
  get"bloggers/edit/:id" , to: "bloggers#edit" , as: "edit"
  get"bloggers/everything", to: "bloggers#everything"
  
  post"bloggers/everything", to: "bloggers#create"
  delete"bloggers/everything", to: "bloggers#delete"

  root"blog#home"

  get"bloggers/:id/comment", to: "comments#load" , as:"blogger_comment_page"
  post"bloggers/:id/comment", to: "comments#make"
  delete"bloggers/:id/comment", to: "comments#delete"

  get"bloggers/:id/comment/:cid", to: "comments#edit" , as:"blogger_comment_edit"
  patch"bloggers/:id/comment/:cid", to: "comments#update", as:"comment"
  put"bloggers/:id/comment/:cid", to: "comments#update" 
end
