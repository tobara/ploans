class TestimonialsController < ApplicationController
  before_action :authenticate_user!, only: [
    :new, :create, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new
    @user = current_user
    @testimonial = Testimonial.new
  end

  def edit
    @user = current_user
    @testimonial = Testimonial.find(params[:id])
  end

  def create
    @user = current_user
    @testimonial = Testimonial.new(testimonial_params)
    @testimonial.user = @user


    if @testimonial.save
      flash[:notice] = "Testimonial added successfully"
      redirect_to root_path
    else
      flash.now[:errors] = @testimonial.errors.full_messages.join(". ")
      render :new
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(testimonial_params)

    if @testimonial.save
      flash[:notice] = 'Testimonial updated successfully'
      redirect_to root_path
    else
      flash.now[:error] = @testimonial.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @testimonial = Testimonial.find(params[:id])
    @testimonial.destroy

    redirect_to root_path, notice: "Testimonial Deleted."
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:description, :rating, :user)
  end

  def authorize_user!
    user = Testimonial.find(params[:id]).user
    unless current_user == user || current_user.admin?
      flash[:alert] = "You Are Not Authorized To View The Page"
      redirect_to after_sign_in_path_for(current_user)
    end
  end
end
