@facultysearch
Feature: Various features of a faculty
  As a student or aspiring student
  I want to view the list of faculties and search among them
  so that I can ne involved in research
Background: Faculties in database
  Given the following faculties exist in database
  | name         | dept   | desc         | email        | office   | phone_no | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 401      |979985738 |1234567   |
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu | 302      |7818      |1234567   |
  | Shweta       | CSCE   | hates cookies|   z@tamu.edu | 490      |456       |1234567   |
  | Pravir       | MECH   | George Lucas |   h@tamu.edu | 789      |456       |1234567   |
@scenario3
Scenario: Navigate the Faculty Experts page
  When I click on the "Find faculty experts" Link on the Navigation Bar
  Then I must be directed to the "Faculties" page 
  When I fill faculty "search" with "Lucas"
  When I search for faculty "Lucas" I should not see "Pravir"

