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

    def print_card_validation card

    end
  end

end
