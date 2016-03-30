Feature: show webpage in cyber security center

  click a tag name, so I can see the content of that page

Scenario: show Research Page
  Given I am on the homepage of cyber security center
  When I click research page button
  Then I should see 188 publications

Scenario: show Faculty Page
  Given I am on any page of Cyber Security Center Website
  When I click Faculty button
  Then I should see Faculty List
  
Scenario: show Education Page
  Given I am on any page of Cyber Security Center Website
  When I click Education button
  Then I should see Education Page
  
Scenario: show Events Page
  Given I am on any page of Cyber Security Center Website
  When I click Events button
  Then I should see Events contents