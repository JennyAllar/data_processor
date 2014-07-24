Rails.application.routes.draw do

  resources :xlsxes do
    collection { post :import }
  end
  
 root "welcome#index"
end
