# frozen_string_literal: true
require_relative "../../lib/flybuys_card_validation/card/base"

Given("A card number of {string}") do |_string|
  @card_number = _string
  @card = FlybuysCardValidation::Card::Base.build(@card_number)
end

When("the card is built") do
  @card = FlybuysCardValidation::Card::Base.build(@card_number)
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

When("the valid? is called") do
  @card_valid_result = @card.valid?
end

Then("it should be {word}") do |result|
  expect(@card_valid_result).to be(result == "true")
end
