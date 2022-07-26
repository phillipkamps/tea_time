require 'rails_helper'

describe 'Tea Time API' do
  it 'creates a subscription to a tea for a customer' do
    post '/api/v1/subscriptions'

    expect(response).to be_successful
  end
end
