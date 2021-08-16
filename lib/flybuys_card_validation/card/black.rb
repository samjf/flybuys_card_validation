require_relative "base"

module FlybuysCardValidation::Card
  class Black < Base
    TYPE = "Fly Buys Black".freeze
    PREFIX = "60141".freeze

    def validate_length
      @number.length == 16 || @number.length == 17
    end
  end
end

