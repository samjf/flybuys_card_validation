##
# Represents a Fly Buys cards with ability for validation and type determination
class Card
  TYPE_BLACK = "Fly Buys Black".freeze
  TYPE_BLUE = "Fly Buys Blue".freeze
  TYPE_RED = "Fly Buys Red".freeze
  TYPE_GREEN = "Fly Buys Green".freeze
  TYPE_UNKNOWN = "Unknown".freeze
  TYPE_BLACK_PREFIX = "60141".freeze
  TYPE_BLUE_PREFIX = "6014".freeze
  TYPE_RED_PREFIX = "6014352".freeze
  TYPE_GREEN_REGEX = /^601435552[6-9]/.freeze

  def initialize(number)
    @number = number
  end

  def type
    if number_starts_with?(TYPE_BLACK_PREFIX)
      TYPE_BLACK
    elsif number_starts_with?(TYPE_RED_PREFIX)
      TYPE_RED
    elsif TYPE_GREEN_REGEX === @number
      TYPE_GREEN
    elsif number_starts_with?(TYPE_BLUE_PREFIX)
      TYPE_BLUE
    else
      TYPE_UNKNOWN
    end
  end

  private

  def number_starts_with?(prefix)
    @number.is_a?(String) && @number.start_with?(prefix)
  end
end
