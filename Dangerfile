# frozen_string_literal: true

require "gitlab_roulette"
require_relative 'lib/gitlab_roulette/gitlab_danger'
require_relative 'lib/gitlab_roulette/danger/request_helper'
require_relative 'lib/gitlab_roulette/danger/helper.rb'
require_relative 'lib/gitlab_roulette/danger/roulette.rb'

puts "current_dir = #{Dir.pwd}\n"
puts "#{%x[ls -la]}\n"

danger.import_plugin('lib/gitlab_roulette/assets/plugins/helper.rb')
danger.import_plugin('lib/gitlab_roulette/assets/plugins/roulette.rb')

danger.import_dangerfile(path: "lib/gitlab_roulette/assets/roulette")