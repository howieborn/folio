Portfolio::Application.routes.draw do
  resources :comments
  resources :posts
  resources :clients
  resources :sessions, :only => [:new, :create, :destroy]
  resources :contacts, :only => [:new, :create]

  match '/signup',  :to => 'clients#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/webhome',  :to => 'pages#webhome'
  match '/musichome',  :to => 'pages#musichome'
  match '/admin',	:to => 'pages#admin'
  match '/articles', :to => 'pages#articles'
  match '/news', 	:to => 'pages#news'
  match '/about',   :to => 'pages#about'
  match '/resume',   :to => 'pages#resume'
  match '/projects',    :to => 'pages#projects'
  match '/skills', 		:to => 'pages#skills'
  match '/resources', 	:to => 'pages#resources'
  match '/tutorials', 	:to => 'pages#tutorials'
  match '/help',    :to => 'pages#help'
  match '/contacts', :to => 'contacts#new'


  root :to => 'pages#webhome'

end
