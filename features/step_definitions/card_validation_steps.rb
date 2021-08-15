require_relative "../../lib/flybuys_card_validation"

Given('a set of Fly Buys cards') do |doc_string|
  @cards_list_str = doc_string
end

When("I ask to print if it is valid") do
  @validation_output = FlybuysCardValidation::Validator.new(@cards_list_str).print_card_validation
end

Then('I should expect the following printed') do |doc_string|
  expect(@validation_output).to eq(doc_string)
end
