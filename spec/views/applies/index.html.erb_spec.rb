require 'rails_helper'

RSpec.describe "applies/index", type: :view do
  before(:each) do
    assign(:applies, [
      Apply.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :city => "City",
        :state => "State",
        :purchase_price => 1,
        :down_payment => 2,
        :email => "Email",
        :phone_number => "Phone Number",
        :contact_method => "Contact Method"
      ),
      Apply.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :city => "City",
        :state => "State",
        :purchase_price => 1,
        :down_payment => 2,
        :email => "Email",
        :phone_number => "Phone Number",
        :contact_method => "Contact Method"
      )
    ])
  end

  it "renders a list of applies" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Method".to_s, :count => 2
  end
end
