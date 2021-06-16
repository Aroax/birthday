require_relative '../../lib/app'
require 'capybara/rspec'

feature 'Testing infrastructure' do
  scenario 'can run app and check page content' do
    visit('/')
    expect(page.status_code).to be(200)
  end
end
