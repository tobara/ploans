class Contact < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :question, presence: true
  validates :contact_method, presence: true
end
