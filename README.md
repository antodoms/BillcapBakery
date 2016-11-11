# BillcapBakery

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/BillcapBakery`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'BillcapBakery'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install BillcapBakery

## Usage
Please check the test script to understand more on the supporting functions for each module classes. This is a part of Trike challenge by Billcap

```ruby
@data = BillcapBakery::Cart.new
@data.bulk("10 VS5\n14 MB11\n13 CF")

#-> 
#	10 VS5 $17.98
#			2 x 5 $8.99
#
#	14 MB11 $54.8
#			1 x 8 $24.95
#			3 x 2 $9.95
#
#	13 CF $25.85
#			2 x 5 $9.95
#			1 x 3 $5.95

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/BillcapBakery. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

