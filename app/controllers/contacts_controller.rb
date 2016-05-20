class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]


  def index
    @contacts = Contact.all
  end


  def show
  end


  def new
    @contact = Contact.new
  end


  def edit
  end


  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:notice] = "Application submitted added successfully!"
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
      params.require(:contact).permit(:first_name, :email, :question, :contact_method)
    end
end
