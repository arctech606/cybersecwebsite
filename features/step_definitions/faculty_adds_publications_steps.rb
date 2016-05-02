Given(/^I have a database of faculties$/) do
  FactoryGirl.create(:faculty,:name => 'Sagar')
  FactoryGirl.create(:faculty,:name => 'Sonali',:email =>'pagli@ss.com')
end
Given(/^I have logged in as a faculty$/) do
  visit login_path
  fill_in('session_email', :with => 'ss@ss.com')
  fill_in('session_password', :with => 'new12345')
  click_button('Log in')
end
Given(/^I click "([^"]*)" link$/) do |arg1|
  click_link('Add a new publication')
end
Then(/^I should be directed to add new publication page$/) do
  current_path.should match (/publications\/new/)
end
Given(/^I fill in details for the publication correctly$/) do
  fill_in('publication_name', :with => 'ss@ss.com')
  fill_in('publication_abstract', :with => 'ss@ss.com')
  fill_in('publication_keywords', :with => 'ss@ss.com')
  select "Books and Chapters", :from => "publication_publication_type"
  select "None", :from => "params_focus_area"
  select "None", :from => "params_cd_topic"
end
