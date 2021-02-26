require 'rails_helper'

RSpec.feature 'Login Feature', type: :feature do
  let(:user) { User.create(username: 'Mike') }
  scenario "Login user and redirect to event's index page" do
    visit login_path

    fill_in 'Username', with: user.username
    click_button('Log In')

    expect(page).to have_current_path(root_path)
  end

  scenario 'Login fails when username is wrong' do
    visit login_path

    fill_in 'Username', with: 'dsflkajdsf;kajsf;lkasdjf'
    click_button('Log In')

    expect(page).to have_current_path(login_path)
  end
end
