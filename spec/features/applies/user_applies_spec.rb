require 'rails_helper'

feature "The applies page: ", %{
  As a user
  I want to apply for a doctor loan
  So that I can obtain financing
  Acceptance Criteria
  [x] I can access the apply now form.
  [x] I can apply with valid info
  [x] I cannot apply with invalid form info
} do


  scenario "A user can access the apply now form" do
    visit root_path
    click_link 'APPLY NOW'

    expect(page).to have_content('Home » Apply Now')
    expect(page).to_not have_content('Home » Contact Us')
  end

  scenario "user applies successfully" do
    visit root_path
    click_link 'APPLY NOW'

    fill_in 'apply_first_name', with: 'Pablo'
    fill_in 'apply_last_name', with: 'Escobar'
    fill_in 'apply_email', with: 'escobar@5446@gmail.com'
    fill_in 'apply_phone_number', with: '603-555-1212'
    fill_in 'apply_city', with: 'Medllin'
    select 'Texas', :from => 'apply_state'
    fill_in 'apply_purchase_price', with: '155000'
    fill_in 'apply_down_payment', with: '25000'
    select 'Phone', :from => 'apply_contact_method'

    click_button 'Submit'

    expect(page).to have_content('Who We Are')
    expect(page).to_not have_content('Home » Apply Now')
  end

  scenario "user inputs incorrect info" do
    visit root_path
    click_link 'APPLY NOW'

    click_button 'Submit'

    expect(page).to have_content('9 errors prohibited you from applying:')
    expect(page).to_not have_content('Who We Are')
  end
end
