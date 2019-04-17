# CurrentUfcChampions

  This program displays information about the current UFC champions of each division. When executed program will display a list of the different divisions in the UFC. User can select a division. Program will then display the info of the champion of the selected division. This includes the champion's name, date title won, how he won the champion, and how many times he defended the title. User can return to main menu or quit. Program will loop until user chooses to quit. All info of divisions and champions are scraped from this url: http://www.espn.com/mma/story/_/id/14947566/current-all-ufc-champions. Enjoy!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'current_ufc_champions'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install current_ufc_champions

## Usage

  Upon execution, program will display a list of the divisions in the UFC. Enter choice (1-12) to see the champion and more info of desired division. Program will display selected division/champion info. Enter choice (y/n) for whether or not you want to exit or return to main menu. If 'y', program will loop back to main menu. If 'n', program will exit.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'ambitious-torrent-9328'/current_ufc_champions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrentUfcChampions project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'ambitious-torrent-9328'/current_ufc_champions/blob/master/CODE_OF_CONDUCT.md).
