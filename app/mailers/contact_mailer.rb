class ContactMailer < ApplicationMailer
  def new_contact(contact)
   @contact = contact
   mail :to => "support@doctorloans.io", :subject => "New Question/ Contact from #{contact.email}"
  end
end
