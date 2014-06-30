Rails.application.routes.draw do
  #get '/', to: redirect("/")
  namespace :api do
    namespace :v1 do
      resources :users, except: [:new, :edit]
      resources :words, only: [:index, :show, :create] do
        resources :definitions, except: [:new, :edit]
      end
    end
  end
end
