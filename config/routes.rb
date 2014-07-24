Rails.application.routes.draw do
  root "books#index"

  resources :books
  
  post "books/fetch_xlsx_data" => "books#fetch_xlsx_data", :as => "book_fetch_xlsx_data"
end
