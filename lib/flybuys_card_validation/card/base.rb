module FlybuysCardValidation::Card 
  ##
  # Represents a Fly Buys cards with ability for validation and type determination
  class Base

    def initialize(number, type: nil)
      @number = number
      @type = type
    end

    def type
      @type || TYPE
    end
  
    def self.build(number)
      klass = if number_starts_with?(number, Black::PREFIX)
        Black
      elsif number_starts_with?(number, Red::PREFIX)
        Red
      elsif Green::REGEX === number
        Green
      elsif number_starts_with?(number, Blue::PREFIX)
        Blue
      else
        Unknown
      end
      klass.new(number)
    end
  
    def self.number_starts_with?(number, prefix)
      @number.is_a?(String) && @number.start_with?(prefix)
    end
  end

  class Unknown < Base
    TYPE = "Unknown".freeze
  end
end

require_relative "./black"
require_relative "./red"
require_relative "./green"
require_relative "./blue"
