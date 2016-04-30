Given(/^the following events exist in database$/) do |table|
  table.hashes.each do |event|
    Event.create!(event)
  end
end

When(/^I fill events "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
 if $1=='search'
    fill_in('search', :with => arg2)
  end
end

When(/^I search for events "([^"]*)" I should not see "([^"]*)"$/) do |query, bug|
  steps %{
    And I fill in "search" with "#{query}"
    And I press "Search for Events"
    Then I should not see "#{bug}"
  }
end