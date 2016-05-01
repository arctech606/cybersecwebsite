Given(/^the following publications exist in database$/) do |publications_table|
  publications_table.hashes.each do |publication|
    Publication.create!(publication)
  end
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  if $1=='search'
    fill_in('search', :with => arg2)
  end
  if $1=='search by faculty experts'
    fill_in('search by faculty experts', :with => arg2)
  end
end

When(/^I click "([^"]*)"$/) do |arg1|
  click_link(arg1)# Write code here that turns the phrase above into concrete actions
end

Then(/^I should not see "([^"]*)" and "([^"]*)"/) do |arg1,arg2|
  page.should have_no_content(arg1)
  page.should have_no_content(arg2)
end



When (/^I click "([^"]*)" Button$/) do |button|
  click_button(button)
end

Then(/^I must be directed to the "([^"]*)" page for the "([^"]*)" Query$/) do |arg1, arg2|
  if $1=='Publications'
  visit "/publications?utf8=✓&search=#{arg2}"
  end
end

When(/^I search for "([^"]*)" I should not find "([^"]*)"$/) do |query, bug|
  steps %{
    And I fill in "search" with "#{query}"
    And I press "Search"
    Then I should not see "#{bug}"
  }
end