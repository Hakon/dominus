# Dominus

Adds an easy to use wrapper around the domino diiop database api.
Memory management (recycling the domino objects) is handled by ruby.

*Warning*: This gem lacks tests. I hope to get around adding some tests soon.

## Installation

Add this line to your application's Gemfile:

    gem 'dominus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dominus

## Usage

```ruby
require "dominus"

client = Dominus::Client.new("domino.example.com:63148", "username", "password")
documents = client.find_database("database.nsf").where("attribute", "value")
documents.each do |document|
  puts document["attribute"] # => value
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
