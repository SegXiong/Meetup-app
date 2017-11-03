Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  root "posts#index"

  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      get "/posts" => "posts#index", :as => :posts

      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"
    end
  end
end
