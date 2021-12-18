Feature: decrementing
  The user should be able to decrement the counter

  Scenario: User decrements the counter multiple times
    Given the counter starts at "10"
    When the user decrements the counter 10 times
    Then the counter displays "0"

  @notYetImplemented
  Scenario: User cannot decrement less than 0
    Given the counter starts at "0"
    When the user decrements the counter 1 time
    Then the counter displays "0"