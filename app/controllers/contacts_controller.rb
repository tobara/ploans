class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]
  add_breadcrumb "Home", :root_path, :title => "Back to DoctorLoans.io Home Page"

  def index
    @contacts = Contact.all
  end


  def show
  end


  def new
    add_breadcrumb "Contact Us"
    @contact = Contact.new
  end


  def edit
  end


  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Application submitted added successfully!"
      ContactMailer.new_contact(@contact).deliver_later
      redirect_to root_path
    else
      flash.now[:errors] = @contact.errors.full_messages.join(". ")
      render :new
    end
  end


  private

    def set_contact
      @contact = Contact.find(params[:id])
    end


    def contact_params
      params.require(:contact).permit(:first_name, :email, :phone_number, :question, :contact_method)
    end
end
