require 'rails_helper'

RSpec.feature 'Create Event Feature', type: :feature do
  let(:user) { create(:user) }

  scenario 'Event will not be create if user is not logged in' do
    visit new_event_path

    expect(page).to have_current_path(login_path)
  end

  scenario 'Event will be created if a user is logged in' do
    visit login_path

    fill_in 'Username', with: user.username
    click_button('Log In')

    visit new_event_path

    fill_in 'event_title', with: 'Title'
    fill_in 'event_description', with: 'Description'
    fill_in 'event_location', with: 'Location'
    fill_in 'event_schedule', with: '2021/5/2'

    click_button('Create Event')

    expect(page).to have_current_path(event_path(Event.first.id))
  end
end
