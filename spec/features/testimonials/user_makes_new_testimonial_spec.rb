require 'rails_helper'

feature "User makes new testimonial: ", %{
  As a user
  I want leave a tesitmonial
  So other users know about my experience
  Acceptance Criteria
  [x] An un-authenticated user cannot acccess testimonial form
  [x] An authenticated can access the new tesitmonial form
  [x] I can leave a tesitmonial with valid info
  [x] I cannot leave a testimonial without valid info
} do

  let!(:user) { FactoryGirl.create(:user) }


  before(:each) do
    visit new_user_session_path
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'LOG IN'
  end

  scenario "An un-authenticated user cannnot acccess tesitmonial form" do
    visit destroy_user_session_path
    visit new_testimonial_path


    expect(page).to have_content('LOG IN')
    expect(page).to_not have_content('Post a Testimonial')
  end

  scenario "authenticated user can access new testimonial form" do
    visit new_testimonial_path

    expect(page).to have_content('Post a Testimonial')
    expect(page).to_not have_content('LOG IN')
  end

  scenario "user inputs valid info" do
    visit new_testimonial_path

    fill_in 'testimonial_description', with: 'A great experience'
    fill_in 'testimonial_rating', with: '8'
    click_button 'Submit'

    expect(page).to have_content('Rating: 8')
    expect(page).to have_content('A great experience')
    expect(page).to_not have_content('Rating: 4')
  end

  scenario "user inputs invalid info" do
    visit new_testimonial_path

    click_button 'Submit'
    expect(page).to have_content('Description can\'t be blank.')
    expect(page).to have_content('Rating can\'t be blank.')
    expect(page).to have_content('Rating is not a number')
    expect(page).to_not have_content('Who We Are')
  end
end
