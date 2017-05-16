Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}, :controllers => { registrations: 'registrations' }
  resources :users
  resources :posts, :shallow => true do
  	resources :comments
  end
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/new'
  root 'posts#index'
end
