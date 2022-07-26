class Tea < ApplicationRecord
  has_many :subscriptions
  has_many :customers, through: :subscriptions

  validates_presence_of :name, :description
  validates_numericality_of :brew_temp_f, :brew_time_mins
end
