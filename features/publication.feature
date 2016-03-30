@publication
Feature: Various features of a publication
  As a student or aspiring student
  I want to view the list of publications and search among them
  so that I can ne involved in research
Background: Publications in database
  Given the following publications exist in database
  | name         | abstract   | keywords     |
  | Sagar        | CSCE       | Lucas        |   
  | Sujoy        | EE         | Lucas        |  
  | Shweta       | CSCE       | hates cookies|   
  | Pravir       | MECH       | Terminr      |
@scenario3
Scenario: Navigate the Research page
  When I click on the "Research" Link on the Navigation Bar
  Then I must be directed to the "Publications" page 
  And I should see "Sagar","Sujoy","Shweta","Pravir"
@scenario4
Scenario: Search Publications
  Given I am on the "Publications" page
  When I fill "search" with "Lucas"
  And I click "Search" Button
  Then I must be directed to the "Publications" page for the "Lucas" Query
  And I should not see "Shweta" and "Shweta"