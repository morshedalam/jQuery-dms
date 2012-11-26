Dms::Application.routes.draw do
  resources :documents, :except => [:edit, :update]
  root :to => 'documents#index'
end
