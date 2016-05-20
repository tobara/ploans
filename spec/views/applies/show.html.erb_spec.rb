require 'rails_helper'

RSpec.describe "applies/show", type: :view do
  before(:each) do
    @apply = assign(:apply, Apply.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :city => "City",
      :state => "State",
      :purchase_price => 1,
      :down_payment => 2,
      :email => "Email",
      :phone_number => "Phone Number",
      :contact_method => "Contact Method"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Contact Method/)
  end
end
