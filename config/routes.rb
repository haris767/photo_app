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
end
