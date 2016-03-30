@faculty
Feature: Navigate through the various faculty sections
  As a user of the website 
  I want to view the list of faculties
  so that I can contact them for my research
Background: Faculties in database
  Given the following faculties exist in database
  | name         | dept   | desc         | email        | office   | phone_no |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 401      |979985738 |
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu | 302      |7818      |
  | Shweta       | CSCE   | hates cookies|   z@tamu.edu | 490      |456       |
  | Pravir       | MECH   | George Lucas |   h@tamu.edu | 789      |456       |
@scenario1
Scenario: view the list of faculties
  When I click on the "Find faculty experts" Link on the Navigation Bar
  Then I must be directed to the "Faculties" page 
  And I should see "Sagar","Sujoy","Shweta","Pravir"
@scenario2
Scenario: view the information correpsonding to a faculty
  Given I am on the "Faculty" page
  When I click on "Show" Link for "Sujoy"
  Then I must be directed to the "details" page for "Sujoy"