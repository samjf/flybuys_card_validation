# frozen_string_literal: true

require_relative "flybuys_card_validation/version"

module FlybuysCardValidation
  class Error < StandardError; end

  ##
  # This class provides validation to Fly Buys cards
  class Validator
    def initialize(card_list_str)
      @card_list_str = card_list_str
    end

    def print_card_validation
      cards = prepare_card_obj_list(@card_list_str)
      card_output = cards.map do |card|
        card.to_s
      end
      card_output.join("\n")
    end

    private

    def prepare_card_obj_list(input_str)
      removed_whitespace_str = input_str.gsub(/ /, "").strip
      card_numbers = removed_whitespace_str.split("\n")
      card_numbers.map do |card_number|
        Card::Base.build(card_number)
      end
    end

  end

end
