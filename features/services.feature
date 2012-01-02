Feature: Services
  In order to browse all services
  As a user
  I want to see all services 

  Scenario: Services List
    Given I have services titled Spotify, Netflix
    When I go to the list of services
    Then I should see "Spotify"
    And I should see "Netflix"