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

  Scenario: a card can determine if it is valid
    Given A card number of <number>
    When the valid? is called
    Then it should be <valid>

    Examples:
      | number            | valid |
      | '60141016700078611' | true  |
      | '6014152705006141'  | false |
      | '6014111100033006'  | true  |
      | '6014709045001234'  | true  |
      | '6014352700000140'  | true  |
      | '6014355526000020'  | true  |
      | '6014355526000028'  | false |
      | '6013111111111111'  | false |