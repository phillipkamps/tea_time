Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/api/v1/customers/:customer_id/subscriptions/:tea_id', to: 'api/v1/subscriptions#create'

  patch '/api/v1/customers/:customer_id/subscriptions/:subscription_id', to: 'api/v1/subscriptions#update'
end
