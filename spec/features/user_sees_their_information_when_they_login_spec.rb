require 'rails_helper'

feature 'User sees their information' do
  scenario 'when they log in' do
    VCR.use_cassette('user-sees-info') do
      stub_logged_in

      visit '/profile?github_user=jamesrnelson'
      expect(page).to have_content('Following 17')
      expect(page).to have_content('Repositories 48')
      expect(page).to have_content('Stars 1')
      expect(page).to have_content('Followers 4')
    end
  end
end
