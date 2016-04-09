@studentlogin
Feature: Login and authentication
   as a student
  I want to log-in to my account 
Background: Students in database
  Given the following students exist in database
  | name         | dept   | desc         | email        | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu | 1234567  |
@scenario1
Scenario: I am not logged in or a user
  Given I have not logged in as a student
  Then I must see the main homepage as a student
@scenario2
Scenario: Creating an account
  Given I am on the student signup page
  And I have entered all the details correctly as expected
  Then I should be directed to my homepage as a student
@scenario3
Scenario: I enter invalid data while creating an account
  Given I am on the student signup page
  And I have entered incorrect details as a student
  Then I should be on the students page  
@scenario4
Scenario: I want to log in as a student
  Given I am a signed-up student
  And I am on the login page as a student
  And I enter correct credentials as a student
  Then I must be on my homepage as a student
@scenario5
Scenario: I entered invalid login information
  Given I am a signed-up student
  And I am on the login page as a student
  And I enter incorrect credentials as a student
  Then I must be redirected to login page as a student
  And I should see "Invalid email/password combination"