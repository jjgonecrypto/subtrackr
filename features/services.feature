Feature: Services
  In order to manage services
  As a user
  I want to see all services 
  and to edit services with their embeddeed schemes

  @javascript
  Scenario: Edit a Service with Schemes
    Given there is a service named "Spotify"
    And with a scheme named "premium" of amount "5.34"
    And with a scheme named "ultra" of amount "23.34"
    When I go to edit the service
    And I delete the scheme named "premium"
    And I submit the form
    Then I should see "ultra" 
    And I should not see "premium"

  Scenario: Services List
    Given there are services named Spotify, Netflix
    When I go to the list of services
    Then I should see "Spotify"
    And I should see "Netflix"

  @javascript
  Scenario: Create a Service with Schemes
    When I go to a new service
    And I enter in "Spotify" as a name
    And I add a scheme with the name "premium" and an amount of "5.50"
    And I submit the form
    Then I should see "Spotify"
    And I should see "premium" 
    And I should see "$5.50"  

  