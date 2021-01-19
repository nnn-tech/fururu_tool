Rails.application.routes.draw do
  get "/" => "home#top"

  get "matter/test" => "matter#test"
  get "matter/production" => "matter#production"

  get "matter/new" => "matter#new"
  get "matter/create" => "matter#new"
  post "matter/create" => "matter#create"

  get "matter/new_import" => "matter#new_import"
  post "matter/import" => "matter#import"

  get "matter/:id/edit" => "matter#edit"
  get "matter/:id/update" => "matter#update"
  post "matter/:id/update" => "matter#update"
  
  post "matter/:id/destroy" => "matter#destroy"

  get "matter/list" => "matter#list"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
