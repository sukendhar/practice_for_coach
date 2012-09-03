Feature: Professional coach organisation member confirms email address
  In order to confirm my membership of a professional body
  As a credentialled Coach
  I want to confirm my email address

Background:



  Scenario:   I have signed up with valid credentials and have not yet confirmed my e-mail address.
              I successfully confirm my e-mail address.

    Given I am logged in
    Then  I see the new Coach Profile page
    Then  I see awaiting email confirmation message
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Given I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see my own home page
    Then  I see a registration confirmation message
    Then  My e-mail is confirmed

  Scenario: I have signed up with valid credentials and have already confirmed my e-mail address.
            I am logged in to my coach practice. I click the confirmation link again.

    Given I am logged in
    Given My e-mail is confirmed
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Given I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see my own home page
    Then  I do not see a registration confirmation message


  Scenario: I have signed up with valid credentials and have already confirmed my e-mail address.
            I am not logged in to my coach practice. I click the confirmation link again.

    Given I am not logged in
    Given My e-mail is confirmed
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Given I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see the sign in page


  Scenario: I have signed up with valid credentials and have not yet confirmed my e-mail address.
            I am logged in to my coach practice.
            I do not have my confirmation e-mail.

    Given I am logged in
    Then  I see awaiting email confirmation message
    Then  I see an option to resend an e-mail confirmation message
    When  I choose the option to resend an e-mail confirmation message
    Then  I see an e-mail confirmation resent message
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Then  I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see my own home page
    Then  I see a registration confirmation message


  Scenario: I have signed up with valid credentials and have not yet confirmed my e-mail address.
            I am logged in to my coach practice. My confirmation link has timed out.

    Given I am logged in
    Then  I see email confirmation expired message
    Then  I see an option to resend an e-mail confirmation message
    When  I choose the option to resend an e-mail confirmation message
    Then  I see an e-mail confirmation resent message
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Then  I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see my own home page
    Then  I see a registration confirmation message


  Scenario: I have signed up with valid credentials and have not yet confirmed my e-mail address.
            I am not logged in to my coach practice. My confirmation link has expired.

    Given I am not logged in
    Given I am logged into my e-mail account
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Then  I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see email confirmation expired message
    Then  I see an option to resend an e-mail confirmation message
    When  I choose the option to resend an e-mail confirmation message
    Then  I see an e-mail confirmation resent message
    Given I see a confirmation e-mail in my inbox
    Given I open the confirmation e-mail
    Then  I see an e-mail confirmation link
    When  I click on the e-mail confirmation link
    Then  I see my own home page
    Then  I see a registration confirmation message