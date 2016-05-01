Given(/^I have a database of publications$/) do
  f=FactoryGirl.create(:publication,:name => "Boring1")
  g=FactoryGirl.create(:publication,:name => "Boring2")
  h=FactoryGirl.create(:publication,:name => "Boring3")
  i=FactoryGirl.create(:publication,:name => "Boring4")
  j=FactoryGirl.create(:publication,:name => "Boring5",:publication_type => "Conference Proceedings and Papers")
  FactoryGirl.create(:publication,:name => "Boring6",:publication_type => "Conference Proceedings and Papers")
  FactoryGirl.create(:cdtopic, :publications => [f,g]) #default cdtopic is security mechanisms
  #f,g belong to security mechanisms
  FactoryGirl.create(:cdtopic,:name =>'Architecture', :publications => [h,i]) #default cdtopic is security mechanisms
  FactoryGirl.create(:focusarea, :publications => [f,g]) #default focus area is critical
  FactoryGirl.create(:focusarea, :name => 'Cryptography / Cryptanalysis', :publications => [h,i])
end

Given(/^I click on "([^"]*)"$/) do |arg1|
  click_button(arg1)
end
Then(/^I should see "([^"]*)" and "([^"]*)"$/) do |arg1, arg2|
  expect(page).to have_content(arg1)
  expect(page).to have_content(arg2)
end