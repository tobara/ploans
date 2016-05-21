class ApplyMailer < ApplicationMailer
  def new_apply(apply)
     @apply = apply
     mail :to => "support@doctorloans.io", :subject => "*New Lead*  Applicant: #{apply.last_name}, #{apply.first_name}"
  end
end
