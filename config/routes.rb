MovesAnalysis::Application.routes.draw do
  root :to => 'places#index'
  resources :places, :only => [:index, :show]
end
