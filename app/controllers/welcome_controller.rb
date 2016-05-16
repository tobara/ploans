class WelcomeController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index

    @testimonials = Testimonial.all
    render :index
    # @user_rating = @testimonials.average(:rating).to_i
  end


  def authorize_user!
    user = Bourbon.find(params[:id]).user
    unless current_user == user || current_user.admin?
      flash[:alert] = "You Are Not Authorized To View The Page"
      redirect_to after_sign_in_path_for(current_user)
    end
  end
end
