Rails.application.routes.draw do
  get "advertisements/show" # required to pass default adv.ctrl. specs pass
  
  resources :advertisements

  resources :posts
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
