Feature: Profile Page
  Scenario: View A Profile Page Without A User
    Given a user ""
    When that user goes to her profile page
    Then she will see "Please provide a user name"

  Scenario: View A User Profile Page
    Given a user "tdenkinger"
    When that user goes to her profile page
    Then she will see "Repositories"
