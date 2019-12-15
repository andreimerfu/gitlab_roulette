# frozen_string_literal: true

require_relative 'lib/gitlab_roulette/gitlab_danger'
require_relative 'lib/gitlab_roulette/gitlab/danger/request_helper'

danger.import_plugin('plugins/helper.rb')
danger.import_plugin('plugins/roulette.rb')

puts "Debugging ====================================== \n"
puts danger.import_plugin('lib/gitlab_roulette/plugins/helper.rb')

puts "================================================= "

danger.import_dangerfile(path: "roulette")
