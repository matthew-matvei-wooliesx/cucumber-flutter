Feature: decrementing
  The user should be able to decrement the counter

  @notYetImplemented
  Scenario: User decrements the counter multiple times
    Given the counter starts at "10"
    When the user decrements the counter 10 times
    Then the counter displays "0"