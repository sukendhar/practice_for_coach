Feature: Coach defines availability
  In order to match my availability with that of potential Coachees
  As a Coach
  I want to define my own availability
  My availability is specified in am/pm format and stored in 24hr format based on GMT

  Background:  Background for all steps

    * I am logged in
    * I have created a profile
    * I have not defined my availability
    * I see the define availability page

  Scenario Outline: I enter valid times and continue to the define locations page


    When  I create an available time on <Day> from <StartTime> <StartAMPM> to <EndTime> <EndAMPM> at <Place>
    Then  I see an availability added message
    Then  I see an available time on <Day> from <StartTime> <StartAMPM> to <EndTime> <EndAMPM> at <Place>
    Then  I see the day and times I chose in the available time message
    Then  I see the define availability page
    When  I choose Next
    Then  I see the request matching Coaches page

  Examples:

  |Day      |StartTime|StartAMPM|EndTime|EndAMPM|Place   |
  |Monday   |9        |AM       |10     |AM     |office  |
  |Tuesday  |10       |PM       |11     |PM     |home    |
  |Wednesday|11       |AM       |1      |PM     |office2 |
  |Thursday |12       |PM       |1      |PM     |office  |
  |Friday   |12       |AM       |2      |AM     |office2 |
  |Saturday |1        |AM       |1      |PM     |office3 |
  |Sunday   |11       |AM       |11     |PM     |home    |
  |Weekdays |11       |AM       |11     |PM     |any     |
  |Weekends |9        |AM       |1      |PM     |office  |


  Scenario Outline: Invalid times

    Given I do not see an available time
    When  I create an available time on <Day> from <StartTime> <StartAMPM> to <EndTime> <EndAMPM>
    Then  I see an invalid availability message
    Then  I do not see the day and times I chose in an available time message

  Examples:

  |Day      |StartTime|StartAMPM|EndTime|EndAMPM|
  |Monday   |9        |AM       |8      |AM     |
  |Tuesday  |10       |PM       |9      |PM     |
  |Wednesday|11       |PM       |12     |AM     |

  Scenario: I have not entered any valid availability times and I try to go to the next page

    Given I do not see an available time
    When  I choose next
    Then  I see a no available times defined message
    Then  I see the request matching Coaches page


  Scenario Outline: I try to enter overlapping available times

    Given I do not see an available
    When  I create an available time on <Day> from <StartTime1> <StartAMPM1> to <EndTime1> <EndAMPM1>
    When  I create an available time on <Day> from <StartTime2> <StartAMPM2> to <EndTime2> <EndAMPM2>
    When  I see an overlapping times message
    Then  I see the define availability page
    When  I choose next
    Then  I see the request matching Coaches page

  Examples:

  |Day      |StartTime1|StartAMPM1|EndTime1|EndAMPM1|StartTime2|StartAMPM2|EndTime2|EndAMPM2|
  |Monday   |9         |AM        |11      |AM      |10        |AM        |11      |AM      |
  |Tuesday  |6         |PM        |10      |PM      |8         |PM        |9       |PM      |
  |Wednesday|5         |PM        |12      |AM      |6         |PM        |12      |AM      |






  