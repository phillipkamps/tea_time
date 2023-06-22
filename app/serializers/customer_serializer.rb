class CustomerSerializer
  include JSONAPI::Serializer
  attributes :id, :first_name, :last_name, :address, :city, :state, :zip, :email
end