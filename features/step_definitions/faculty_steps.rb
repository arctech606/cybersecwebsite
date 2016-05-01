# Add a declarative step here for populating the DB with faculties.
Given(/^the following faculties exist in database$/) do |faculties_table|
  faculties_table.hashes.each do |faculty|
    Faculty.create!(faculty)
  end
end

When(/^I click on the "([^"]*)" Link on the Navigation Bar$/) do |arg1|
  if ($1 == 'Find faculty experts') # Write code here that turns the phrase above into concrete actions
    click_link('Find faculty experts')
  end
  if ($1 == 'Research')
    click_link('Research')
  end
  if ($1=='Events')
    click_link('Research')
  end
end

Then(/^I must be directed to the "([^"]*)" page$/) do |arg1|
  if arg1=='Faculties'
    visit(faculties_path)
  end# Write code here that turns the phrase above into concrete actions
  if arg1=='Publications'
    visit(publications_path)
  end
  if arg1=='Events'
    visit(events_path)
  end
end
Then(/^I should see "([^"]*)","([^"]*)","([^"]*)","([^"]*)"$/) do |arg1, arg2, arg3, arg4|
  page.should have_content(arg1)# Write code here that turns the phrase above into concrete actions
  page.should have_content(arg2)
  page.should have_content(arg3)
  page.should have_content(arg4)
end

When(/^I search for faculty "([^"]*)" I should not see "([^"]*)"$/) do |query, bug|
  steps %{
    And I fill in "search" with "#{query}"
    And I press "Search for Faculty Experts"
    Then I should not see "#{bug}"
  }
end

When(/^I fill faculty "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  if $1=='search'
    fill_in('search', :with => arg2)
  end
  if $1=='search by faculty experts'
    fill_in('search by faculty experts', :with => arg2)
  end
end


When(/^I click on "([^"]*)" Link for "([^"]*)"$/) do |arg1, arg2|
  if $1=='Show'
    click_link('Show')
  end
end

Then(/^I must be directed to the "([^"]*)" page for "([^"]*)"$/) do |arg1, arg2|
  if $1=='details'
    visit(faculty_path(Faculty.find_by_title($2)))
  end
  if $1=='enter_uin'
    visit(uin_path)
  end
end


