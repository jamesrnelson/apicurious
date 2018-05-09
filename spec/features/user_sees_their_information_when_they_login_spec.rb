require 'rails_helper'

feature 'User sees their information' do
  scenario 'when they log in' do
    stub_logged_in

    visit profile_path
    expect(page).to have_content('Following: 10')
  end
end
