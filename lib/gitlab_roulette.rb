require "gitlab_roulette/version"
require "faraday"
require "ostruct"
require "json"

require "danger"
require_relative "../danger/plugins/helper.rb"
require_relative "../danger/plugins/roulette.rb"

require "gitlab_roulette/danger/helper"
require "gitlab_roulette/danger/request_helper"
require "gitlab_roulette/danger/roulette"
require "gitlab_roulette/danger/teammate"

module GitlabRoulette
  class Error < StandardError; end
end
