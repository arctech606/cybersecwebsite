@searchbaby
Feature: Advanced Search feature
Background: 
  Given I have a database of publications
@scenario1
Scenario: I am on the search page and searching through cyber defense topics
  Given I am on the "Publications" page
  And I select "Security Mechanisms/Functionality" from "params_cd_topic"
  And I click on "Search"
  Then I should see "Boring1" and "Boring2"
  And I should not see "Boring3" and "Boring4"
@scenario2
Scenario: I am on the search page and searching through focus areas
  Given I am on the "Publications" page
  And I select "Cryptography / Cryptanalysis" from "params_focus_area"
  And I click on "Search"
  Then I should see "Boring3" and "Boring4"
  And I should not see "Boring1" and "Boring2"
@scenario3
Scenario: I am on the search page and searching through publication types
  Given I am on the "Publications" page
  And I select "Books and Chapters" from "params_publication_type"
  And I click on "Search"
  Then I should see "Boring1" and "Boring2"
  And I should not see "Boring5" and "Boring6"