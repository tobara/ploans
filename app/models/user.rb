class User < ActiveRecord::Base
  has_many :testimonials, dependent: :destroy

  devise(
    :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable)

  validates :username, presence: true

  def admin?
    role == 'admin'
  end

  def current_user
    @current_user ||= user_from_remember_token
  end

end
