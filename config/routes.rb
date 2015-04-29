Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :topics
  end

  resources :topics do
    member do
      put :fav
      put :unfav
    end

    resources :comments do
      member do
        put :flag
        put :unflag
      end
    end
  end

  get 'about' => 'static_page#about'
  root to: "topics#index"
end
