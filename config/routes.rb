Rails.application.routes.draw do
  get '/', to: redirect("/")
  resources :users, except: [:new, :edit]
  resources :words, only: [:index, :show, :create] do
    resources :definitions, except: [:new, :edit]
  end
end
