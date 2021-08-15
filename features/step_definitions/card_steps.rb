require_relative "../../lib/flybuys_card_validation/card"

Given("A card number of {string}") do |_string|
  @card_number = _string
end

When("the card is created") do
  @card = Card.new(@card_number)
end

Then("it should be the type {string}") do |type|
  expect(@card.type).to eq(type)
end

Given("a Fly Buy card with a number of {string}") do |string|
  @card_number = string
end

Then("I should have {string} printed") do |_string|
  pending # Write code here that turns the phrase above into concrete actions
end
