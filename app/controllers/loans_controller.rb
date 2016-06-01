class LoansController < ApplicationController
add_breadcrumb "Home", :root_path, :title => "Back to DoctorLoans.io Home Page"

  def doctor
    add_breadcrumb "Doctor Loan"
    set_meta_tags title: 'DoctorLoans.io:  Doctor Loan Guidelines',
              description: 'The DoctorLoans.io Doctor Loan Page',
              keywords: 'physician loans, physician loan, physician personal loans, loans for physicians, resident physician loans, physician loan program, loans for resident physicians, personal loans for physicians, regions bank physician loan, physician loan rates, business loans for physicians,exclusive physician loans, physician loan interest rate, physician loans rates, physician relocation loan, physician practice loans, home loans for dentists, mortgages for dentists, dentist mortgage'
    render :doctor
    # @user_rating = @testimonials.average(:rating).to_i
  end


  def other
    add_breadcrumb "Other Loan Options"
    set_meta_tags title: 'DoctorLoans.io:  Other Loan Guidelines',
              description: 'The DoctorLoans.io Other Loan Options Page',
              keywords: 'mortgage, refinance, purchase a home, FHA, conforming, Jumbo, mortgage rates'
    render :other
    # @user_rating = @testimonials.average(:rating).to_i
  end
end
