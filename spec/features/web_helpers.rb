def enter_name_and_birthday
  visit('/')
  fill_in('Name', with: 'Arran')
  fill_in('Birthday', with: '1986-09-03')
  click_button('Submit')
end
