Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :category
      resources :product
      resources :image
    end
  end
end
