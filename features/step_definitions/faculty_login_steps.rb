Given(/^I have entered all the details correctly$/) do
   fill_in('faculty_name', :with => 'John')
   fill_in('faculty_dept', :with => 'Dept')
   fill_in('faculty_desc', :with => 'Really long desc')
   fill_in('faculty_email', :with => 'sagarsamant51@gmail.com')
   fill_in('faculty_phone_no', :with => '9799857384')
   fill_in('faculty_office', :with => 'John')
   fill_in('faculty_password', :with => 'John')
   fill_in('faculty_password_confirmation',:with =>'John')
   #@newfaculty = Faculty.create!(:name => 'John',:dept => 'Dept',:desc=>'Really',:email=>'sagarsamant51@gmail.com',:phone_no:'9799857384')
   click_button('Create Account')
end

Then(/^I should be directed to my homepage$/) do
  expect(page).to have_content('John')
end

Given(/^I have entered incorrect details$/) do
  click_button('Create Account')
end

Then(/^I should see a list of errors in the form$/) do
  expect(page).to have_content(/The form contains (.*) errors./)
end

Given(/^I am a signed\-up faculty$/) do
  Faculty.find_by(:name =>'Sagar').should_not be_nil
end

Given(/^I enter correct credentials$/) do
  fill_in('session_email', :with => 's@tamu.edu')
  fill_in('session_password', :with => '1234567')
  click_button('Log in')
end

Then(/^I must be on my homepage$/) do
  faculty_path(Faculty.find_by(:name => 'Sagar'))
end

Then(/^I should not see the "([^"]*)" and "([^"]*)" options on the navbar$/) do |arg1, arg2|
   page.should have_no_content(arg1)
   page.should have_no_content(arg2)
end

Given(/^I enter incorrect credentials$/) do
  fill_in('session_email', :with => 's@tamu.edu')
  fill_in('session_password', :with => '12345678')
  click_button('Log in')
end
Then(/^I must be redirected to login page$/) do
  login_path
end

Given(/^I haven't logged in$/) do
  expect(Faculty.find_by(:name =>'radnom')).to be_nil
end

Then(/^I must see the "([^"]*)" and "([^"]*)" options on the navbar$/) do |arg1, arg2|
  expect(page).to have_content(arg1)
  expect(page).to have_content(arg2)
end

