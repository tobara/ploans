class Testimonial < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: true
  validates :rating, presence: true
  validates :rating, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 10 }
end
