Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

  In order to sign up, I must enter a valid ICF membership number. The email address I specify in the sign-up form must match the email address in my ICF profile.
  The surname I specify should be the same as the name in my ICF profile.
  My ICF profile can be found at http://nnf.coachfederation.org/profiles/members.aspx?memberID=nnnnnnn where nnnnnnn is my member number.
  Sign-up is confirmed by email to the address in the ICF profile.

  Background:
    Given I am not logged in
    Given I am on the sign-up page
    Given I see an option to sign up as a credentialled coach

  Scenario Outline: User signs up with correct ICF credentials

    When I choose to sign up as a credentialled coach
    And  I choose to register as an ICF credentialed Coach
    Then I do not see a list of training providers
    Then I see an option to enter my member-number
    When I sign up with <email> and <name> and <member_number> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I see the new Coach Profile page
    Then I see awaiting email confirmation message

  Examples:
    |email             |name              |member_number|message             |password|password_confirmation|credential|
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a successful sign up|123abc  |123abc               |ACC       |
    |kpgarrod@gmail.com|KP Garrod         |9026152      |a successful sign up|123abc  |123abc               |ACC       |
    |lmowen@shaw.ca    |Mary Amohanga     |1021048      |a successful sign up|abc456  |abc456               |PCC       |


  Scenario Outline: User signs up with incorrect ICF credentials
    When I choose to sign up as a credentialled coach
    When I choose to register as an ICF credentialed Coach
    When I sign up with <email> and <name> and <member_number> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email             |name              |member_number|message                        |password|password_confirmation|
    |kpgarrod@gmail.com|Keith Garrod      |0008999      |an incorrect icf member number |123abc  |123abc               |
    |kpgarrod@yahoo.com|Keith Garrod      |9026152      |an incorrect email             |123abc  |123abc               |
    |kpgarrod@gmail.com|KP Garrod         |9026152      |an invalid email               |123abc  |123abc               |
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a missing password confirmation|123abc  |                     |
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a missing password             |        |123abc               |
    |kpgarrod@gmail.com|Keith Garrod      |9026152      |a mismatched password          |abc123  |123abc               |

