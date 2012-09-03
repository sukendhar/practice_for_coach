Feature: Coach signs-in to MyCoachPractice
  In order to get access to protected sections of the site
  As a Coach
  I want to sign in

  Scenario: User is not signed up
    Given I do not exist as a user
    When I sign in with valid credentials
    Then I see an invalid login message
    And I should be signed out


  Scenario: User has sigfned-up successfully but has not created a profile. The user signs in  with valid credentials.
    Given I exist as a user
    And I am not logged in
    When  I sign in with valid credentials
    Then  I see the New Coach form
    When  I return to the site
    Then  I should be signed in
    And   I see the New Coach form

  Scenario: User has not confirmed email address. The user signs in with valid credentials.
    Given I exist as a user
    And I am not logged in
    When  I sign in with valid credentials
    Then I should see awaiting email confirmation message

  Scenario: User has signed-up successfully and has created a profile. The user signs in with valid credentials.
    Given I exist as a user
    And I am not logged in
    When  I sign in with valid credentials
    Then  I see my own home page


  Scenario: User enters wrong email
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong email
    Then I see an invalid login message
    And I should be signed out

  Scenario: User enters wrong password
    Given I exist as a user
    And I am not logged in
    When I sign in with a wrong password
    Then I see an invalid login message
    And I should be signed out

      