@facultylogin
Feature: Login and authentication
  As a faculty
  I want to log-in to my account 
  so that I can post stuff for my students
Background: Faculties in database
  Given the following faculties exist in database
  | name         | dept   | desc         | email        | office   | phone_no | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 401      |979985738 |1234567   |
@scenario1
Scenario: I am not logged in or a user
  Given I haven't logged in
  Then I must see main homepage
@scenario2
Scenario: Creating an account
  Given I am on the faculty signup page
  And I have entered all the details correctly
  Then I should be directed to my homepage
@scenario3
Scenario: I enter invalid data while creating an account
  Given I am on the faculty signup page
  And I have entered incorrect details
  Then I should be on the faculties page  
  And I should see a list of errors in the form
@scenario4
Scenario: I want to log in
  Given I am a signed-up faculty
  And I am on the login page
  And I enter correct credentials
  Then I must be on my homepage
  And I should not see the "faculty login" and "student login" options on the navbar
@scenario5
Scenario: I entered invalid login information
  Given I am a signed-up faculty
  And I am on the login page
  And I enter incorrect credentials
  Then I must be redirected to login page
  And I should see "Invalid email/password combination"