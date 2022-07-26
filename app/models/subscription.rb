class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates_presence_of :title, :status, :frequency
  validates_numericality_of :price
end
