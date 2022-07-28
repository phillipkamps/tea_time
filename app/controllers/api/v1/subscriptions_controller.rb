class Api::V1::SubscriptionsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @tea = Tea.find(params[:tea_id])
    @subscription = @customer.subscriptions.new(subscription_params)
    @subscription.update(title: "#{@customer.first_name}'s #{@tea.name} Subscription",
                         status: 'Active')
    @subscription.save
    render json: SubscriptionSerializer.new(@subscription), status: :created
  end

  def update
    @subscription = Subscription.find(params[:subscription_id])
    @subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(@subscription), status: :ok
  end

  private

  def subscription_params
    params.require(:subscription).permit(:price, :frequency, :tea_id, :status)
  end
end
