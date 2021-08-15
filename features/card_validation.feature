Feature: We can validate a list of Fly Buys cards.
  Card numbers must be passed in line by line (one set of numbers per line).

  Scenario: validate a set of cards
    Given a set of Fly Buys cards
      """
      60141016700078611
      6014152705006141
      6014111100033006
      6014709045001234
      6014352700000140
      6014355526000020
      6014 3555 2900 0028
      6013111111111111
      """
    When I ask to print if it is valid
    Then I should expect the following printed
      """
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Black: 6014111100033006 (valid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Red: 6014352700000140 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Fly Buys Green: 6014355526000028 (invalid)
      Unknown: 6013111111111111 (invalid)
      """