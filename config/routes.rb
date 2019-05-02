Rails.application.routes.draw do
  get 'miniature_api/getMinis'
  
  get 'miniature_api/getMini/:id' => 'miniature_api#getMini'
  

  get 'miniature_api/voteMini' => 'miniature_api#voteMini'
  get 'miniature_api/getNextMini'
  get 'miniature_api/alreadyVoted' => 'miniature_api#alreadyVoted'
  get 'miniature_api/analyzeMini' => 'miniature_api#analyzeMini'
  
  get 'home/index'

  root 'home#index'
  resources :miniatures
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
