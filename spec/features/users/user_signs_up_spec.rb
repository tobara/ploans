require "rails_helper"

feature 'new user signs up', %{
  As a prospective user
  I want to sign up
  So I apply for a doctor loan

  Acceptance Criteria
  [X] I will create an account from sign up page
  [X] I must specify a valid username
  [X] I must specify a valid e-mail
  [X] I must specify a password and confirm that password
  [X] I get error messages if I do not perform the above
  [X] I register my account and am authenticated if I specify valid information
} do

  scenario "prospective user gets to sign up page from root path" do
    visit root_path
    click_link "SIGN IN"
    click_link "Sign up"
    expect(page).to have_button("SIGN UP")
    expect(page).to_not have_content("SIGN OUT")
  end

  scenario "prospective user correctly submits sign up form" do
    visit root_path
    click_link "SIGN IN"
    click_link 'Sign up'
    fill_in 'user_email', with: 'escobar457@gmail.com'
    fill_in 'user_username', with: 'Pablo'
    fill_in 'user_password', with: 'money$17'
    fill_in 'user_password_confirmation', with: 'money$17'
    click_button 'SIGN UP'

    expect(page).to have_content('Pablo')
    expect(page).to have_content('SIGN OUT')
    expect(page).to_not have_content('SIGN IN')
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link "SIGN IN"
    click_link 'Sign up'
    click_button 'SIGN UP'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("Username can't be blank")
    expect(page).to_not have_content('SIGN OUT')
  end

  scenario 'password does not match confirmation' do
    visit root_path
    click_link "SIGN IN"
    click_link 'Sign up'
    fill_in 'user_email', with: 'escobar457@gmail.com'
    fill_in 'user_username', with: 'Pablo'
    fill_in 'user_password', with: 'money$17'
    fill_in 'user_password_confirmation', with: 'money$18'
    click_button 'SIGN UP'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('SIGN OUT')
  end
end
