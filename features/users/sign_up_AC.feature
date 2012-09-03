Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

  The email address I specify in the sign-up form must match the email address in my AC profile.
  The surname I specify should be the same as the name in my AC profile.
  Sign-up is confirmed by email to the address in the AC profile.

  Background:
    Given I am not logged in
    Given I am on the sign-up page
    Given I see an option to sign up as a credentialled coach

  Scenario Outline: User signs up with correct AC credentials

    When I choose to sign up as a credentialled coach
    Then I see an option for AC credentialled coach
    And  I see an option for ICF credentialled coach
    When I choose AC credentialed coach
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the new Coachee Profile page
    Then I should see <credential> in my credentials

  Examples:
    |email                    |name              |message                        |password|password_confirmation|credential              |
    |trudy@dancingleopards.com|Trudy Arthurs     |a successful sign up           |123abc  |123abc               |Founding Council Member |
    |maureen@theatkins.org.uk |Maureen Atkins    |a successful sign up           |abc123  |abc123               |Member                  |


  Scenario Outline: User signs up with incorrect AC credentials

    When I choose to sign up as a credentialled coach
    When I choose to register as an AC credentialed coach
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email                    |name              |message                        |password|password_confirmation|
    |trudy@dancingleopards.com|Keith Garrod      |an incorrect email             |123abc  |123abc               |
    |kpgarrod@gmail           |KP Garrod         |an invalid email               |123abc  |123abc               |
    |trudy@dancingleopards.com|Trudy Arthurs     |a missing password confirmation|        |123abc               |
    |trudy@dancingleopards.com|Trudy Arthurs     |a mismatched password          |abc123  |123abc               |

