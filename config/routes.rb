Rails.application.routes.draw do
  resources :keywords
  resources :events, except: :new
  get 'new_event/.:development_id'=> 'events#new', as: :new_event
  delete 'delete_event/.:id'=> 'events#destroy', as: :delete_event

  resources :developments
  root 'homepage#homepage'
  resources :users
  post 'cookie_consent'=> 'homepage#cookie_consent', as: :cookie_consent
  post 'reset_cookie' => 'homepage#reset_cookie_consent', as: :reset_cookie_consent
  post 'log_in' => 'homepage#log_in', as: :log_in
  post 'log_out' => 'homepage#log_out', as: :log_out  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'development_add_keyword/.:id'=> 'developments#add_keyword', as: :development_add_keyword
  post 'development_remove_keyword/.:id'=> 'developments#remove_keyword', as: :development_remove_keyword

  get 'search'=> 'homepage#search', as: :search
  get 'search_select'=> 'homepage#search_select', as: :search_select
  get 'timeline_pdf' => 'homepage#timeline_pdf', as: :timeline_pdf
end
