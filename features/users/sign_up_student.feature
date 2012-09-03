Feature: Sign up
  In order to get access to protected sections of the site
  As a user
  I want to be able to sign up

  Background:
    Given I am not logged in
    Given I am on the sign-up page
    Given I see an option to sign up as a credentialled coach
    Given I see an option to sign up as a student

  Scenario Outline: User signs up as a registered student with valid credentials
    When I choose to register as a registered student on an Accredited Coach Training Program
    When I sign up email with "<email>" and name with "<name>" and password with "<password>" and confirm_password with "<password_confirmation>"     
    Then I should see "<message>" message
    Then I see a list of training providers
    Then I select "<training_provider>" and "<course>"    
    Then An email should be sent to the MyCoachPractice administrator

  Examples:
    |email                    |name              |message               |password  |password_confirmation  |training_provider         |course                 |
    |kpgarrod@gmail.com       |Keith Garrod      |awaiting confirmation |123abc    |123abc                 |Jan Abbey                 |NLP Coach Certification|  

  Scenario Outline: User signs up as a registered student with invalid credentials
    When I choose to register as a registered student on an Accredited Coach Training Program
    When I sign up with <email> and <name> and <password> and <password_confirmation>
    Then I see a list of training providers
    Then I select <training_provider> and <course>
    Then I should see <message> message
    Then I should see the sign-up page

  Examples:
    |email                    |name              |message               |password|password_confirmation|training_provider          |course      |
    |trudy@dancingleopards.com|Keith Garrod      |not a coaching program|123abc  |123abc               |Joe Bloggs Training Company|Coaching 101|
