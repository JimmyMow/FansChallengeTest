FansChallengeTest::Application.routes.draw do
  root 'calls#index'

  get '/contact' => 'calls#contact' , as: 'contact'

  get '/calls' => 'calls#index', as: 'calls'

  get '/calls/new' => 'calls#new', as: 'new_call'
  post '/calls' => 'calls#create'

  get '/calls/:id' => 'calls#show', as: 'call'

  get '/calls/:id/edit' => 'calls#edit', as: 'edit_call'
  patch '/calls/:id' => 'calls#update'

  delete '/calls/:id' => 'calls#destroy'

  post '/comments' => 'comments#create', as: 'create_comment'

end
