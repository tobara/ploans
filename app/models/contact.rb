class Contact < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  validates :question, presence: true
end
