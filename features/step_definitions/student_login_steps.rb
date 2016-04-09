Given(/^the following students exist in database$/) do |table|
  table.hashes.each do |student|
    Student.create!(student)
  end
end

Given(/^I have entered all the details correctly$/) do
   fill_in('student_name', :with => 'John')
   fill_in('student_dept', :with => 'Dept')
   fill_in('student_desc', :with => 'Really long desc')
   fill_in('student_email', :with => 'sagarsamant51@gmail.com')
   fill_in('student_password', :with => 'John')
   fill_in('student_password_confirmation',:with =>'John')
   #@newstudent = Student.create!(:name => 'John',:dept => 'Dept',:desc=>'Really',:email=>'sagarsamant51@gmail.com',:phone_no:'9799857384')
   click_button('Create Account')
end

Then(/^I should be directed to my homepage$/) do
    students_path(Student.find_by(:name => 'John'))
end

Given(/^I have entered incorrect details$/) do
  click_button('Create Account')
end

#Then(/^I should see a list of errors in the form$/) do
 # expect(page).to have_content(/The form contains (.*) errors./)
#end

Given(/^I am a signed\-up student$/) do
  Student.find_by(:name =>'Sagar').should_not be_nil
end

Given(/^I enter correct credentials$/) do
  fill_in('session_email', :with => 's@tamu.edu')
  fill_in('session_password', :with => '1234567')
  click_button('Log in')
end

Then(/^I must be on my homepage$/) do
  student_path(Student.find_by(:name => 'Sagar'))
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
  expect(Student.find_by(:name =>'radnom')).to be_nil
end

Then(/^I must see the main homepage$/) do
 '/'  
end

