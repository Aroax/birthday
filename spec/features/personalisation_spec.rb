require_relative '../../lib/app'
require 'capybara/rspec'

feature 'it can be personalised' do
  scenario 'it takes and returns a name' do
    visit('/')
    fill_in('Name', with: 'John')
    click_button('Submit')
    expect(page). to have_content('Hello, John!')
  end
end
