Tea.destroy_all
Customer.destroy_all

FactoryBot.create_list(:customer, 10)

FactoryBot.create_list(:tea, 10)
