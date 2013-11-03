FansChallengeTest::Application.routes.draw do
  # SESSIONS
  root to: 'sessions#new'

  get '/sessions/new' => 'sessions#new', as: 'new_session'

  post '/sessions' => 'sessions#create', as: 'session'

  delete '/sessions' => 'sessions#destroy'

  #GAMES
  get '/games' => 'games#index', as: 'games'

  get '/games/new' => 'games#new', as: 'new_game'
  post '/games' => 'games#create'

  get '/games/:id' => 'games#show', as: 'game'

  get '/games/:id/edit' => 'games#edit', as: 'edit_game'
  patch '/games/:id' => 'games#update'

  delete '/games/:id' => 'games#destroy'

  # VIOLATIONS
  get '/violations' => 'violations#index', as: 'violations'

  get '/violations/new' => 'violations#new', as: 'new_violation'
  post '/violations' => 'violations#create'

  get '/violations/:id' => 'violations#show', as: 'violation'

  get '/violations/:id/edit' => 'violations#edit', as: 'edit_violation'
  patch '/violations/:id' => 'violations#update'

  delete '/violations/:id' => 'violations#destroy'

  patch '/call_upvote' => 'violations#violation_upvote', as: 'violation_upvote'

  patch '/call_downvote' => 'violations#violation_downvote', as: 'violation_downvote'

  #COMMENTS
  post '/comments' => 'comments#create', as: 'create_comment'

  patch '/upvote' => 'comments#upvote', as: 'upvote_comment'

  patch '/downvote' => 'comments#downvote', as: 'downvote_comment'

  #USERS
  get '/users' => 'users#index', as: 'users'

  get '/users/new' => 'users#new', as: 'new_user'
  post '/users' => 'users#create'

  get '/users/:id' => 'users#show', as: 'user'

  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'

  delete '/users/:id' => 'users#destroy'

  #TEAMS
  get '/teams' => 'teams#index', as: 'teams'

  get '/teams/:id' => 'teams#show', as: 'team'

  get '/teams/:id/edit' => 'teams#edit', as: 'edit_team'
  patch '/teams/:id' => 'nbateams#update'

  #PLAYERS
  resources :players

  #REFS
  resources :refs


end
