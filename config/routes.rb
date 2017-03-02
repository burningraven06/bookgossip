Rails.application.routes.draw do
  resources :topic_replies
  resources :topics
	resources :groups
	resources :reviews
	resources :genres
	resources :publishers
	resources :books
	resources :authors
	resources :users
	resources :sessions
	resources :password_resets
	resources :memberships
	
	resources :users do
		member do
			get :account_confirmation
		end
	end
	
	get 'calendar' => 'extrapages#calendar', as: :calendar
	get '/bookgosp' => 'extrapages#root_home_page', as: :bookgosp_home

	get '/signup' =>'users#new', as: :common_signup
	post '/signup' => 'users#create'
	# get '/login' => "sessions#new" 
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'
	delete '/logout' => 'sessions#destroy'
	
	patch '/users/:id/edit' => 'users#update_password', as: :update_user_password
	get '/groups/:id/join' => 'memberships#new', as: :create_form_membership
	post '/groups/:id/join' => 'memberships#create', as: :create_membership
	
	get '/groups/:id/topics/new' => 'topics#new', as: :group_new_topic
	post '/groups/:id/topics/new' => 'topics#create', as: :group_create_topic

	patch '/memberships/:id/edit'	=> 'memberships#update'
	get 'about' => 'extrapages#about'

	get '/topics/:id/topic_replies/new' => 'topic_replies#new', as: :topic_new_reply
	post '/topics/:id/topic_replies/new' => 'topic_replies#create', as: :topic_create_reply

end
