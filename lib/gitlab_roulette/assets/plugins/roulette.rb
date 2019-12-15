# frozen_string_literal: true

require_relative '../../danger/roulette'

module Danger
  class Roulette < Plugin
    # Put the helper code somewhere it can be tested
    include Gitlab::Danger::Roulette
  end
end
