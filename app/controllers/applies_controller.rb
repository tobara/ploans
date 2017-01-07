class AppliesController < ApplicationController
  add_breadcrumb "Home", :root_path, :title => "Back to Doctor Loans IO Home Page"
  include StatesHelper
  before_action :set_apply, only: [:show, :edit, :update, :destroy]

  def index
    @applies = Apply.all
  end

  def new
    add_breadcrumb "Apply Now"
    set_meta_tags title: 'Doctor Loans IO:  Apply Now',
          description: 'The Doctor Loans IO: Apply Page',
          keywords: 'mortgage, refinance, Apply now, pre approval, pre qualify'
    @apply = Apply.new
  end

  def create
    @apply = Apply.new(apply_params)

    if @apply.save
      flash[:notice] = "Application submitted added successfully!"
      ApplyMailer.new_apply(@apply).deliver_later
      redirect_to root_path
    else
      flash.now[:errors] = @apply.errors.full_messages.join(". ")
      render :new
    end
  end

  def destroy
    @apply.destroy
    respond_to do |format|
      format.html { redirect_to applies_url, notice: 'Apply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_apply
      @apply = Apply.find(params[:id])
    end


    def apply_params
      params.require(:apply).permit(:first_name, :last_name, :city, :state, :purchase_price, :down_payment, :email, :phone_number, :contact_method)
    end
end
