# frozen_string_literal: true

require "gitlab_roulette"

module Danger
  class Roulette < Plugin
    include Gitlab::Danger::Roulette
  end
end
