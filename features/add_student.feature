@studentadd
Feature: Adding students to my team
  As a faculty, I want to add students to my team
Background: Students in database
  Given the following students exist in database
  | name         | dept   | desc         | email        | password | uin     |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 1234567  |724004161|
   Given the following faculties exist in database
  | name         | dept   | desc         | email        | office   | phone_no | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 401      |979985738 |1234567   |
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu | 302      |7818      |1234567   |
@scenario1
Scenario: I want to add a student step a
  Given I am on the faculty profile page
  And I click on "Add new Student" button
  Then I must be directed to the enter_uin page for faculty
  
@scenario2
Scenario: I search for student by UIN
  Given I am on the uin page
  And I fill in "uin" with "724004161"
  And I click on "Search student by UIN" button
  Then I should be redirected to the results page 
  And I should see details of "Sagar"
  
@scenario3
Scenario: I search for invalid student
  Given I am on the uin page
  And I fill in "uin" with "724"
  And I click on "Search student by UIN" button
  Then I should see "No student with the UIN found"