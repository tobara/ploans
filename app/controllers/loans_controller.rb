class LoansController < ApplicationController


  def doctor
    render :doctor
    # @user_rating = @testimonials.average(:rating).to_i
  end


  def other
    render :other
    # @user_rating = @testimonials.average(:rating).to_i
  end
end
