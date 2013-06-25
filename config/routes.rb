JqueryDms::Application.routes.draw do
  resources :documents, :except => [:edit, :update, :show]
  root :to => 'documents#index'
end
