Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "books#index"

  resources :books, only: %i(show index) do
    post "create_review", to: "books#create_review"
  end

  post "ajax_search_book", to: "books#search"
end
