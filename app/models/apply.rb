class Apply < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :purchase_price, presence: true
  validates :down_payment, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :contact_method, presence: true
  validates :purchase_price, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 3000000 }
  validates :purchase_price, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 3000000 }
end
