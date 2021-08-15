require_relative "base"

module FlybuysCardValidation::Card
  class Green < Base
    TYPE = "Fly Buys Green".freeze
    REGEX = /^601435552[6-9]/.freeze
  end
end

