# frozen_string_literal: true
require_relative "base"

module FlybuysCardValidation::Card
  class Green < Base
    TYPE = "Fly Buys Green"
    REGEX = /^601435552[6-9]/.freeze
  end
end
