Feature: Services
  In order to manage services
  As a user
  I want to see all services 
  and to edit services with their embeddeed schemes

  @javascript
  Scenario: Edit a Service with Schemes
    Given there is a service named "Spotify" with the following schemes:
    | name    | amount    | frequency   | offset  |
    | premium | 3.23      | monthly     | 12      |
    | ultra   | 4.55      | monthly     | 0       |
    When I go to edit the service named "Spotify"
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
    And I enter in "Spotify" as the name
    And I add schemes with the following:
    | name    | amount    | frequency   | offset  |
    | premium | 5.50      | monthly     | 12      |
    And I submit the form
    Then I should see "Spotify"
    And I should see "premium" 
    And I should see "$5.50"
    And I should see "M"  