class WelcomeController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index

    @testimonials = Testimonial.all
    render :index
    # @user_rating = @testimonials.average(:rating).to_i
  end


  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
