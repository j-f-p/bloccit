Rails.application.routes.draw do
  get 'sponsors/show'

  get 'sponsors/new'

  get 'sponsors/edit'

  resources :topics do
    resources :posts, except: [:index]
  end
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
