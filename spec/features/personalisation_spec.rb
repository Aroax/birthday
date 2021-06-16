require_relative '../../lib/app'
require 'capybara/rspec'

feature 'it can be personalised' do
  scenario 'it takes and returns a name' do
    enter_name_and_birthday
    expect(page). to have_content('Hello, Arran!')
  end

  scenario 'it takes and returns a birthday' do
    enter_name_and_birthday
    expect(page). to have_content('Your birthday is: 1986-09-03')
  end

  context 'when not your birthday' do
      scenario 'it tells you how long until your birthday' do
        
        enter_name_and_birthday
        expect(page).to have_content('It is ')
      end
  end

end
