# Gitlab Roulette

Gitlab Roulette chooses automatically a random reviewer and maintainer for your merge request and prints a beautiful message using DangerBot.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gitlab_roulette'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gitlab_roulette

## Usage

First of all, you must set some environment variables to your Gitlab CI pipeline:

```yaml
  CI_PROJECT_NAME: "your_project_name"
  GITLAB_ROULETTE_URL: "url to json file"
  GITLAB_HOST: "https://self_hosted_gitlab_url"
```

Then all you have to do is to create a Dangerfile in the root directory of the project with the following configuration:

```ruby
	# frozen_string_literal: true

	danger.import_dangerfile(gem: "gitlab_roulette")
```

GITLAB_ROULETTE_URL contains a JSON file with all the users from your Gitlab and his rank

```json
[
	{
		"username":"andrei.merfu","name":"Andrei Merfu",
		"role":"Backend Engineer",
		"projects": {
			"gitlab_roulette":"maintainer backend"
		}
	},
	{
		"username":"another.user","name":"X Y",
		"role":"Backend Engineer",
		"projects": {
			"gitlab_roulette":"reviewer backend"
		}
	}
]
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).