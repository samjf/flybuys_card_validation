# frozen_string_literal: true
require_relative "base"

module FlybuysCardValidation::Card
  class Black < Base
    TYPE = "Fly Buys Black"
    PREFIX = "60141"

    def validate_length
      @number.length == 16 || @number.length == 17
    end
  end
end
