Feature: Incrementing
  The user should be able to increment a counter.

  Scenario: User increments the counter correctly multiple times
    Given the counter starts at "0"
    When the user increments the counter 10 times
    Then the counter displays "10"