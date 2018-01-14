Rails.application.routes.draw do
  get 'questions/show' # required to pass default questions ctrllr specs
  get 'questions/edit' # required to pass default questions ctrllr specs

  resources :questions

  resources :posts
  
  get 'about' => 'welcome#about'

  root 'welcome#index'
end
