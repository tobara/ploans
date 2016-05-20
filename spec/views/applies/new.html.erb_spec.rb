require 'rails_helper'

RSpec.describe "applies/new", type: :view do
  before(:each) do
    assign(:apply, Apply.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :city => "MyString",
      :state => "MyString",
      :purchase_price => 1,
      :down_payment => 1,
      :email => "MyString",
      :phone_number => "MyString",
      :contact_method => "MyString"
    ))
  end

  it "renders new apply form" do
    render

    assert_select "form[action=?][method=?]", applies_path, "post" do

      assert_select "input#apply_first_name[name=?]", "apply[first_name]"

      assert_select "input#apply_last_name[name=?]", "apply[last_name]"

      assert_select "input#apply_city[name=?]", "apply[city]"

      assert_select "input#apply_state[name=?]", "apply[state]"

      assert_select "input#apply_purchase_price[name=?]", "apply[purchase_price]"

      assert_select "input#apply_down_payment[name=?]", "apply[down_payment]"

      assert_select "input#apply_email[name=?]", "apply[email]"

      assert_select "input#apply_phone_number[name=?]", "apply[phone_number]"

      assert_select "input#apply_contact_method[name=?]", "apply[contact_method]"
    end
  end
end
