# OpenInApp Rails Plugin

Adds support to redirect specific URLs to their mobile app equivalents

## Installation

Add this line to your application's Gemfile:

    gem 'rails-open-in-app', require: 'open_in_app'

And then execute:

    $ bundle

## Usage

In the controllers you want to redirect to your mobile app, call ```open_in_app```:

    open_in_app :only => :show

Then implement ```open_in_app_url``` to return the correct URL to open the app:

    def open_in_app_url
      "scoutmobshoppe://products/#{params[:id]}
    end

## Contributing

1. Fork it ( https://github.com/Scoutmob/rails-open-in-app/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
