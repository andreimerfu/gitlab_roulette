# frozen_string_literal: true

require_relative '../../lib/gitlab_roulette/danger/helper'

module Danger
  # Common helper functions for our danger scripts. See Gitlab::Danger::Helper
  # for more details
  class Helper < Plugin
    # Put the helper code somewhere it can be tested
    include GitlabRoulette::Danger::Helper
  end
end
