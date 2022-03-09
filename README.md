❗ Deprecated
# Gitlab Roulette

Gitlab Roulette chooses automatically a random reviewer and maintainer for your merge request and prints a beautiful message using DangerBot.

<a href="https://ibb.co/Sn9Dsyd"><img src="https://i.ibb.co/hWtx79Z/Screenshot-2019-12-15-at-16-10-36.png" alt="Screenshot-2019-12-15-at-16-10-36" border="0"></a>

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'danger-gitlab'
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

Then, create a `Dangerfile` in the root directory of the project with the following configuration:

```ruby
	# frozen_string_literal: true

	danger.import_plugin('danger/plugins/helper.rb')
	danger.import_plugin('danger/plugins/roulette.rb')

	danger.import_dangerfile(path: 'danger/roulette')
```

Finally, copy `danger` directory from this repository to your app root directory.


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

More informations here: https://danger.systems/guides/getting_started.html

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
