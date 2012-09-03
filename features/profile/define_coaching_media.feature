Feature: Coach defines communication media

  In order to be matched with Coachees who I will be able to coach via my preferred communication Medium
  As a Coach
  I define my preferred methods of communication

  Background:

    * I am signed-up as a Coach
    * I am logged in
    * I have not defined my communications media
    * I am on my new Coach Profile page


  Scenario Outline: I define the Medium of coaching

    When I see that the <Medium> Medium is unchecked
    When I choose to coach via <Medium>
    Then I see options to coach by different media
    Then I see the <Medium> option is checked
    When I choose Next
    Then I see the define availability page

  Examples:

    |Medium       |
    |email        |
    |Skype        |
    |face-to-face |
    |phone        |

  