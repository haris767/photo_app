Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"
# config/routes.rb
resources :photos do
  collection do
    get :by_date
  end
end

# OR this also works
get "photos_by_date", to: "photos#by_date"

resources :users, only: [ :show ] do
  member do
    post "follow"
    delete "unfollow"
  end
end
end
