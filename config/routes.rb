Rails.application.routes.draw do
  get '/my' => 'my#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users,
    controllers: {
      sessions:      'users/sessions'
    }

  root to: 'welcome#index'
end
