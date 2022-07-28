require 'rails_helper'

describe 'Tea Time API' do
  let!(:customer) { create(:customer) }
  let!(:tea) { create(:tea) }

  it 'creates a subscription to a tea for a customer' do
    subscription_params = {
      title: "#{customer.first_name}'s #{tea.name} Subscription",
      price: '4.99',
      status: 'Active',
      frequency: 'Monthly',
      tea_id: tea.id,
      customer_id: customer.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post "/api/v1/customers/#{customer.id}/subscriptions/#{tea.id}",
         headers: headers,
         params: JSON.generate(subscription: subscription_params)

    subscription_json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(subscription_json[:type]).to eq 'subscription'
    expect(subscription_json[:attributes].count).to eq 6
    expect(subscription_json[:attributes][:customer_id]).to eq customer.id
    expect(subscription_json[:attributes][:tea_id]).to eq tea.id
  end

  it 'updates status of subscription' do
    subscription_params = {
      title: "#{customer.first_name}'s #{tea.name} Subscription",
      price: '4.99',
      status: 'Active',
      frequency: 'Monthly',
      tea_id: tea.id,
      customer_id: customer.id
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post "/api/v1/customers/#{customer.id}/subscriptions/#{tea.id}",
         headers: headers,
         params: JSON.generate(subscription: subscription_params)

    expect(response).to be_successful
    previous_status = Subscription.last.status

    update_status_params = {
      status: 'Cancelled'
    }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    patch "/api/v1/customers/#{customer.id}/subscriptions/#{Subscription.last.id}",
          headers: headers,
          params: JSON.generate(update_status_params)

    expect(response).to be_successful

    current_status = Subscription.last.status
    expect(current_status).to_not eq previous_status

    subscription_json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(subscription_json[:type]).to eq 'subscription'
    expect(subscription_json[:attributes].count).to eq 6
    expect(subscription_json[:attributes][:status]).to eq 'Cancelled'
    expect(subscription_json[:attributes][:customer_id]).to eq customer.id
    expect(subscription_json[:attributes][:tea_id]).to eq tea.id
  end

  it 'gets all subscriptions for a customer' do
    tea_list = create_list(:tea, 5)
    subscription_list = tea_list.map do |tea|
      create(:subscription,
             { customer_id: customer.id,
               tea_id: tea.id,
               title: "#{customer.first_name}'s #{tea.name} Subscription" })
    end

    get "/api/v1/customers/#{customer.id}/subscriptions"
    expect(response).to be_successful

    subscription_json = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(subscription_json.count).to eq 5

    subscription_json.each do |subscription|
      expect(subscription[:attributes].count).to eq 6
      expect(subscription[:attributes][:title]).to be_a String
      expect(subscription[:attributes][:price]).to be_a Float
      expect(subscription[:attributes][:status]).to be_a String
      expect(subscription[:attributes][:frequency]).to be_a String
      expect(subscription[:attributes][:customer_id]).to eq customer.id
      expect(subscription[:attributes][:tea_id]).to be_an Integer
    end
  end
end
