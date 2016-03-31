@events
Feature: Navigate through the events sections
  As a user I want to browse the various events which are a part of the program
  so that I can participate in some of them
  and gain some knowledge
Background: Events in database
  Given the following events exist in database
  | name         | date   | desc         | venue        | 
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu |    
  | Shweta       | CSCE   | hates cookies|   z@tamu.edu | 
  | Pravir       | MECH   | George Lucas |   h@tamu.edu | 
@scenario5
Scenario: view the list of events
  When I click on the "Events" Link on the Navigation Bar
  Then I must be directed to the "Events" page 
  And I should see "Sagar","Sujoy","Shweta","Pravir"
