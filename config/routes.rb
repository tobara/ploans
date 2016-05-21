Rails.application.routes.draw do

  resources :applies do
  end
  resources :contacts do
  end
  resources :testimonials do
  end
  scope :loans, :controller => 'loans' do
  get 'doctor'
  get 'other'
end
  devise_for :users
  devise_scope :user do
    root to: 'welcome#index'
      get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
