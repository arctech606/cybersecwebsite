@studentssearch
Feature: Various features of a Student
  As a student or aspiring student
  I want to view the list of faculties and search among them
  so that I can ne involved in research
Background: Students in database
  Given the following students exist in database
  | name         | dept   | desc         | email         | password |
  | Sagar        | CSCE   | George Lucas |   s@tamu.edu  |1234567   |
  | Sujoy        | EE     | Ridley Scott |   b@tamu.edu  |1234567   |
  | Shweta       | CSCE   | hates cookies|   z@tamu.edu  |1234567   |
  | Pravir       | MECH   | George Lucas |   h@tamu.edu  |1234567   |
@scenario3
Scenario: Navigate the Student page
  When I am viewing the "students"
  When I fill student "search" with "Sujoy"
  When I search for student "Sujoy" I should not see "Pravir"

