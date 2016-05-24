class WelcomeController < ApplicationController
  before_action :authorize_user, except: [:index, :show]

  def index
    set_meta_tags title: 'DoctorLoans.io:  The home mortgage resource for Doctors',
              description: 'The DoctorLoans.io Home Page',
              keywords: 'physician loans, physician loan, physician personal loans, loans for physicians, resident physician loans, physician loan program, loans for resident physicians, personal loans for physicians, regions bank physician loan, physician loan rates, business loans for physicians,exclusive physician loans, physician loan interest rate, physician loans rates, physician relocation loan, physician practice loans, home loans for dentists, mortgages for dentists, dentist mortgage'
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
