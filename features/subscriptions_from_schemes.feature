Feature: Subscriptions from Schemes
  In order to create and edit subscriptions
  As a user
  I want to populate my subscription details from existing services

  @javascript
  Scenario: Create a Subscription from an existing Scheme with no weekly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix" with the following schemes:
    | name    | amount    | frequency   | offset  |
    | premium | 5.34      | weekly      | 0       |
    When I go to a new subscription for user "test"
    And I enter in "net" as the service
    And I select "Netflix" from the autocomplete dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "weekly"
    And I should see "Offset" populated with todays day of the week
  
  @javascript
  Scenario: Create a Subscription from an existing Scheme with no monthly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix" with the following schemes:
    | name    | amount    | frequency   | offset  |
    | premium | 5.34      | monthly     | 0       |
    When I go to a new subscription for user "test"
    And I enter in "net" as the service
    And I select "Netflix" from the autocomplete dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "monthly"
    And I should see "Offset" populated with todays day of month

  @javascript
  Scenario: Create a Subscription from an existing Scheme with no yearly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix" with the following schemes:
    | name    | amount    | frequency   | offset  |
    | premium | 5.34      | yearly      | 0       |
    When I go to a new subscription for user "test"
    And I enter in "net" as the service
    And I select "Netflix" from the autocomplete dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "yearly"
    And I should see "Offset" populated with todays day of year

  @javascript
  Scenario: Create a Subscription from an existing Scheme with a fixed offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix" with the following schemes:
    | name    | amount    | frequency   | offset  |
    | premium | 5.34      | monthly     | 12      |
    When I go to a new subscription for user "test"
    And I enter in "net" as the service
    And I select "Netflix" from the autocomplete dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "monthly"
    And I should see "Offset" populated with "12"
