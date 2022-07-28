Tea.destroy_all
Customer.destroy_all
Subscription.destroy_all

customer_list = FactoryBot.create_list(:customer, 10)
tea_list = FactoryBot.create_list(:tea, 10)

customer_list.each do |customer|
  (1..5).to_a.sample.times do
    tea = tea_list.sample
    FactoryBot.create(:subscription,
                      { customer_id: customer.id,
                        tea_id: tea.id,
                        title: "#{customer.first_name}'s #{tea.name} Subscription" })
  end
end
