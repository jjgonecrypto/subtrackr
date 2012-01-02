Feature: Subscriptions from Schemes
  In order to create and edit subscriptions
  As a user
  I want to populate my subscription details from existing services

  Scenario: Create a Subscription from an existing Scheme with no weekly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix"
    And with a scheme named "premium" of amount "5.34" and frequency "weekly" and offset "0"
    When I go to a new subscription
    And I enter "net" as the service
    And I select "Netflix" from the dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "weekly"
    And I should see "Offset" populated with today's day of the week
  
  Scenario: Create a Subscription from an existing Scheme with no monthly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix"
    And with a scheme named "premium" of amount "5.34" and frequency "monthly" and offset "0"
    When I go to a new subscription
    And I enter "net" as the service
    And I select "Netflix" from the dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "monthly"
    And I should see "Offset" populated with today's day of month

  Scenario: Create a Subscription from an existing Scheme with no yearly offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix"
    And with a scheme named "premium" of amount "5.34" and frequency "yearly" and offset "0"
    When I go to a new subscription
    And I enter "net" as the service
    And I select "Netflix" from the dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "monthly"
    And I should see "Offset" populated with today's day of year

  Scenario: Create a Subscription from an existing Scheme with a fixed offset
    Given I am a user with the username of "test"
    And there is a service named "Netflix"
    And with a scheme named "premium" of amount "5.34" and frequency "monthly" and offset "12"
    When I go to a new subscription
    And I enter "net" as the service
    And I select "Netflix" from the dropdown
    And I click the "premium" scheme
    Then I should see "Amount" populated with "5.34"
    And I should see "Frequency" populated with "monthly"
    And I should see "Offset" populated with "12"
