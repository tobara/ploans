class PrivacyController < ApplicationController
add_breadcrumb "Home", :root_path, :title => "Back to Doctor Loans IO Home Page"

  def index
    add_breadcrumb "Privacy Policy and Disclaimer"
    set_meta_tags title: 'Privacy Policy and Disclaimer - Doctor Loans IO',
              description: 'Doctor Loans IO:  Site Privacy Policy and Disclaimer',
              keywords: 'physician loans, physician loan, physician personal loans, loans for physicians, resident physician loans, physician loan program, loans for resident physicians, personal loans for physicians, regions bank physician loan, physician loan rates, business loans for physicians,exclusive physician loans, physician loan interest rate, physician loans rates, physician relocation loan, physician practice loans, home loans for dentists, mortgages for dentists, dentist mortgage'
  end
end




