class Api::V1::SubscriptionsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @tea = Tea.find(params[:tea_id])
    @subscription = Subscription.new(tea_id: @tea.id, customer_id: @customer.id)
    @subscription.update(
      title: "#{@customer.first_name}'s #{@tea.name} Subscription",
      price: subscription_params[:price],
      frequency: subscription_params[:frequency],
      status: 'Active'
    )
    @subscription.save
    render json: SubscriptionSerializer.new(@subscription), status: :created
  end

  def update
    @subscription = Subscription.find(params[:subscription_id])
    @subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(@subscription), status: :ok
  end

  def index
    @customer = Customer.find(params[:customer_id])
    render json: SubscriptionSerializer.new(@customer.subscriptions)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:price, :frequency, :status)
  end
end
