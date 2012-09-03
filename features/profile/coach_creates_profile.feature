Feature: Coach creates Profile

  In order publicise my capabilities
  as a Coach
  I create a Profile on mycoachpractice.com

  Background:

    Given   I am logged in
    Given   I do not have a Coach Profile

  Scenario: I am an ICF credentialed Coach. I correctly create my Coach page from my Home page.

    Then    I see the New Coach Profile form
    Then    I acknowledge the ICF Code of Ethics
    Then    I complete my ICF details
    When    I complete the Coach details correctly
    Then    I see the Coach Created message
    Then    I see my own home page
    Then    I see the Coachees link
