require 'rails_helper'

describe 'APICurious Logging in' do
  it 'should be able to click on Sign in with GitHub' do
    VCR.use_cassette('user-logs-in') do
      stub_omniauth

      visit root_path
      expect(page.status_code).to eq(200)

      within '.navbar' do
        click_link 'Sign in with GitHub'
      end
      expect(current_path).to eq(root_path)
    end
  end
end
