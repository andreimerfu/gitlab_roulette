# frozen_string_literal: true

require_relative 'lib/gitlab_roulette/gitlab_danger'
require_relative 'lib/gitlab_roulette/danger/request_helper'

danger.import_plugin('danger/plugins/helper.rb')
danger.import_plugin('danger/plugins/roulette.rb')

require 'digest/md5'

MESSAGE = <<MARKDOWN
## Reviewer roulette

Changes that require review have been detected! A merge request is normally
reviewed by both a reviewer and a maintainer in its primary category (e.g.
~frontend or ~backend), and by a maintainer in all other categories.
MARKDOWN

CATEGORY_TABLE_HEADER = <<MARKDOWN

To spread load more evenly across eligible reviewers, Danger has randomly picked
a candidate for each review slot. Feel free to override this selection if you
think someone else would be better-suited, or the chosen person is unavailable.

Once you've decided who will review this merge request, mention them as you
normally would! Danger does not (yet?) automatically notify them for you.

| Category | Reviewer | Maintainer |
| -------- | -------- | ---------- |
MARKDOWN

UNKNOWN_FILES_MESSAGE = <<MARKDOWN

These files couldn't be categorised, so Danger was unable to suggest a reviewer.
Please consider creating a merge request to
[add support](https://gitlab.com/gitlab-org/gitlab/blob/master/lib/gitlab/danger/helper.rb)
for them.
MARKDOWN

NO_REVIEWER = 'No reviewer available'.freeze
NO_MAINTAINER = 'No maintainer available'.freeze

def spin_for_category(team, project, category, branch_name)
  puts "team = #{team}\n project=#{project}\n category=#{category}\n branch_name=#{branch_name}\n"
  random = roulette.new_random(branch_name)
  labels = gitlab.mr_labels
  puts "labels = #{labels}"

  reviewers, traintainers, maintainers =
    %i[reviewer? traintainer? maintainer?].map do |kind|
      team.select do |member|
        member.public_send(kind, project, category, labels) # rubocop:disable GitlabSecurity/PublicSend
      end
    end

  # TODO: take CODEOWNERS into account?
  # https://gitlab.com/gitlab-org/gitlab/issues/26723

  puts "reviewers = #{reviewers}\n maintainers=#{maintainers}\n"
  # Make traintainers have triple the chance to be picked as a reviewer
  reviewer = roulette.spin_for_person(reviewers + traintainers + traintainers, random: random)
  maintainer = roulette.spin_for_person(maintainers, random: random)

  "| #{helper.label_for_category(category)} | #{reviewer&.markdown_name || NO_REVIEWER} | #{maintainer&.markdown_name || NO_MAINTAINER} |"
end

changes = helper.changes_by_category

# Ignore any files that are known but uncategorized. Prompt for any unknown files
changes.delete(:none)
categories = changes.keys - [:unknown]

# Ensure to spin for database reviewer/maintainer when ~database is applied (e.g. to review SQL queries)
categories << :database if gitlab.mr_labels.include?('database') && !categories.include?(:database)

# Single codebase MRs are reviewed using a slightly different process, so we
# disable the review roulette for such MRs.
# CSS Clean up MRs are reviewed using a slightly different process, so we
# disable the review roulette for such MRs.
if changes.any? && !gitlab.mr_labels.include?('single codebase') && !gitlab.mr_labels.include?('CSS cleanup')
  # Strip leading and trailing CE/EE markers
  canonical_branch_name =
    roulette.canonical_branch_name(gitlab.mr_json['source_branch'])

  team =
    begin
      roulette.project_team(helper.project_name)
    rescue => err
      warn("Reviewer roulette failed to load team data: #{err.message}")
      []
    end

  project = helper.project_name
  unknown = changes.fetch(:unknown, [])

  rows = categories.map { |category| spin_for_category(team, project, category, canonical_branch_name) }

  markdown(MESSAGE)
  markdown(CATEGORY_TABLE_HEADER + rows.join("\n")) unless rows.empty?
  markdown(UNKNOWN_FILES_MESSAGE + helper.markdown_list(unknown)) unless unknown.empty?
end
