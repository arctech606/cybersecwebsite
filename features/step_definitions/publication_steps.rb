Given(/^the following publications exist in database$/) do |publications_table|
  publications_table.hashes.each do |publication|
    Publication.create!(publication)
  end
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  if $1=='search'
    fill_in('search', :with => arg2)
  end
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link(arg1)# Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" and "([^"]*)"/) do |arg1,arg2|
  page.should have_no_content(arg1)
  page.should have_no_content(arg2)
end

When(/^I click "([^"]*)" Button$/) do |arg1|
  click_button(arg1)
end