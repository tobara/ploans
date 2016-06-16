Rails.application.routes.draw do
  resources :privacy, only: [:index]
  resources :applies do
  end
  resources :contacts do
  end
  resources :testimonials do
  end
  scope :mortgages, :controller => 'mortgages' do
    get 'doctor', :path => '/physician-doctor-dentist/loan-program-guidelines'
    get 'other', :path => '/FHA-Conv-Jumbo/loan-program-guidelines'
    get 'rates_in_free_fall', :path => '/mortgage-insight/articles/rates-in-free-fall'
    get 'home_values', :path => '/mortgage-insight/articles/underwater-sink-or-swim'
  end
   devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'}, controllers: {
        sessions: 'users/sessions', :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup'}
      }

  devise_scope :user do
    root to: 'welcome#index'
      get '/logout' => 'devise/sessions#destroy'
  end


end
