@eventssearch
Feature: Various features of a publication
  As a student or aspiring student
  I want to view the list of events and search among them
  so that I can be involved in research
Background: Events in database
  Given the following events exist in database
  | name         | date   | desc         | venue        | 
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu |    
  | Shweta       | CSCE   | hates cookies|   z@tamu.edu | 
  | Pravir       | MECH   | George Lucas |   h@tamu.edu | 
Scenario: Navigate the Student page
  When I click on the "Events" Link on the Navigation Bar
  Then I must be directed to the "Events" page 
  When I fill events "search" with "Lucas"
  When I search for events "Lucas" I should not see "Pravir"