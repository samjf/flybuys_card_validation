module FlybuysCardValidation::Card 
  ##
  # Represents a Fly Buys cards with ability for validation and type determination
  class Base

    TYPE = "Unknown".freeze

    def initialize(number, type: nil)
      @number = number
      @type = type
    end

    def type
      @type || self.class::TYPE
    end
    
    def valid?
      validate_length && validate_sum
    end

    def validate_length
      @number&.length == 16
    end

    def validate_sum
      # double every second number
      target_modulo = (@number.length - 1) % 2
      split_number = @number.split('')
      doubled_num_list = double_every_second_num_in_list(split_number, target_modulo)

      # sum each number, split if > 10
      summed_doubles_list = doubled_num_list.map{ |num| split_number_and_sum(num) }
      (summed_doubles_list.sum % 10).zero?
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
      number.is_a?(String) && number.start_with?(prefix)
    end

    def to_s
      "#{type}: #{@number} (#{valid? ? 'valid' : 'invalid'})"
    end

    private

    ##
    # If a number is >10 then split it as a string and sum it together
    def split_number_and_sum(number)
      number.to_s.split('').map(&:to_i).sum
    end

    ##
    # Double ever second number in a list if the index eqls zero on the given modulo
    def double_every_second_num_in_list(list, target_modulo)
      list.map.with_index do |num, idx|
        num_i = num.to_i
        (idx % 2) == target_modulo ? num_i : num_i * 2
      end
    end

  end
  class Unknown < Base; end
end

require_relative "./black"
require_relative "./red"
require_relative "./green"
require_relative "./blue"
