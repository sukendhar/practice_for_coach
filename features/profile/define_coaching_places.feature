Feature:
  In order to be matched with Coachees who I can coach in my preferred places
  As a Coach
  I want to define my working places


  Scenario: I want to be coached in person. I create a location near which to be coached. Geonames.org


    When I choose to be coached in person
    Then I see a form to create a location
    When I enter a valid location name
    Then I see that my profile country is selected in the country select box
    When I enter a partial name of a town
    Then I see a list of matching towns
    When I choose a town
    Then I see the timezone is set for this location
    Then I see the coordinates are set for this location
    Then I correctly specify a radius from this location
    When I choose to save the location
    Then I see the location details that I entered
    Then I see options to be coached by different media
    Then I see the in person option is checked
    When I choose Next
    Then I see the request matching coaches page


  