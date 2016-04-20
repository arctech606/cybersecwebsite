Given(/^I click on "([^"]*)" button$/) do |arg1|
  click_button(arg1)
end
Then(/^I must be directed to the enter_uin page for faculty$/) do
 current_path.should == "/uin"
end
Then(/^I should be redirected to the results page$/) do
 current_path.should match /uin_search/
end
Then(/^I should see details of "([^"]*)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
