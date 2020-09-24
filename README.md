# Omniauth::Sentry

[![Travis-CI](https://travis-ci.org/fnando/omniauth-sentry.svg)](https://travis-ci.org/fnando/omniauth-sentry)
[![CodeClimate](https://codeclimate.com/github/fnando/omniauth-sentry.svg)](https://codeclimate.com/github/fnando/omniauth-sentry)
[![Gem](https://img.shields.io/gem/v/omniauth-sentry.svg)](https://rubygems.org/gems/omniauth-sentry)
[![Gem](https://img.shields.io/gem/dt/omniauth-sentry.svg)](https://rubygems.org/gems/omniauth-sentry)

[Sentry](http://sentry.io)'s OAuth2 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-sentry'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-sentry

## Usage

`OmniAuth::Strategies::Sentry` is simply a Rack middleware. Read the OmniAuth
docs for detailed instructions: <https://github.com/intridea/omniauth>.

First, create a new application at `https://sentry.io/api/applications/`. Your
callback URL must be something like `https://example.com/auth/sentry/callback`.
For development you can use `http://127.0.0.1:3000/auth/sentry/callback`.

Here's a quick example, adding the middleware to a Rails app in
`config/initializers/omniauth.rb`. This example assumes you're exporting your
credentials as environment variables.

Possible scopes (you have to separate them with a space):

- `event:admin`
- `event:read`
- `member:admin`
- `member:read`
- `org:admin`
- `org:read`
- `org:write`
- `project:admin`
- `project:read`
- `project:releases`
- `project:write`
- `team:admin`
- `team:read`
- `team:write`

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :sentry,
            ENV['SENTRY_CLIENT_ID'],
            ENV['SENTRY_CLIENT_SECRET'],
            scope: 'org:read member:read project:read team:read'
end
```

Now visit `/auth/sentry` to start authentication against Sentry.

## Contributing

1. Fork it ( https://github.com/fnando/omniauth-sentry/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
