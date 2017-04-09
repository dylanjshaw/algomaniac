Rails.application.routes.draw do

  devise_for :users
  resources :notes
  get 'home/index'

  authenticated do
    root 'notes#index', as: :authenticated
  end

  root 'home#index'

end

# authenticated do
#   root :to => 'welcome#index', as: :authenticated
# end
#
# root :to => 'home#static_page'
