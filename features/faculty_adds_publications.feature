@pubadd
Feature: Faculty wants to add a publication
Background: Publications in database
  Given the following publications exist in database
  | name         | abstract   | keywords     |
  | Sagar1        | CSCE       | Lucas        |   
  | Sujoy1        | EE         | Lucas        |  
  | Shweta1       | CSCE       | hates cookies|   
  | Pravir1       | MECH       | Terminr      |
  And the following faculties exist in database
  | name         | dept   | desc         | email        | office   | phone_no | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 401      |979985738 |1234567   |
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu | 302      |7818      |1234567   |

@scenario1
Scenario: I wanna add a publication as a faculty
  Given I have logged in as a faculty
  And I click "Add a new publication" link
  Then I should be directed to add new publication page
  Given I fill in details for the publication correctly
  And I click on "Create Publication" button