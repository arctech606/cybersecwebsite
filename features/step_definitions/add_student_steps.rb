Given(/^I click on a "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end
Then(/^I must be directed to the enter_uin page for faculty$/) do
 current_path.should == uin_path
end
Then(/^I should be redirected to the results page$/) do
 current_path.should match /uin_search/
end
Then(/^I should see details of "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
Given(/^I am logged in as "([^"]*)"$/) do |arg1|
   visit(faculty_path(Faculty.find_by(:name =>"Sagar")))
end
Given(/^I click on the "([^"]*)" button$/) do |arg1|
  visit uin_path
end