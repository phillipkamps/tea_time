class Api::V1::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    all_customers_list = []
    @customers.each do |customer|
      all_customers_list << CustomerSerializer.new(customer)
    end
    render json: all_customers_list
  end
end