Feature: We have a Fly Buys card with a number, type, and a function to determine if it is valid.
  Scenario: a card can determine its type by the FB number
    Given A card number of <number>
    When the card is created
    Then it should be the type <type>

    Examples:
      | number              | type             |
      | '60141016700078611' | 'Fly Buys Black' |
      | '6014709045001234'  | 'Fly Buys Blue'  |
      | '6014352700000140'  | 'Fly Buys Red'   |
      | '6014355526000020'  | 'Fly Buys Green' |
      | '6013111111111111'  | 'Unknown'        |