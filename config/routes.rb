Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "books#index"

  resources :books, only: %i(show index)
  post "ajax_post_review/:book_id", to: "books#post_review"
  post "ajax_search_book", to: "books#search"

  resources :reviews, only: %i(create)
end
