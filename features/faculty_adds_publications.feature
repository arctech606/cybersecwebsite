@pubadd
Feature: Faculty wants to add a publication
Background: Database hai for faculties
  Given I have a database of faculties
@scenario1
Scenario: I wanna add a bitchin publication
  Given I have logged in as a faculty
  And I click "Add a new publication" link
  Then I should be directed to add new publication page
  Given I fill in details for the publication correctly
  And I click on "Create Publication"