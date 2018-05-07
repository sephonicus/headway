# Headway

Generate progress percentages for processes that have multiple, sometimes nested, stages. Format progress percentages and times for presentation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'headway'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install headway

## Usage

Initialize a new Progress instance:

```ruby
progress = Headway::Progress.new
```

When the current process is composed of several stages, tell the Progress instace how many there will be:

```ruby
progress.start_multistage_process stages: 4
```

Now, tell it when the progress of the current stage has changed, and when each stage is completed. Overall progress output is aware of each stage's contribution to overall completion:

```ruby
progress.set_percentage 23.5
progress.percentage
 # => 5.9

# enter stage 2
progress.set_complete
progress.set_percentage 23.5
progress.percentage
 # => 30.9
```

Once all stages are marked completed, the instance will indicate such in percentage and from the `completed?` method:

```ruby
3.times { progress.set_complete }
progress.percentage
 # => 100.0
progress.completed?
 # => true
```

`Headway::Progress` correctly indicates overall completion even with nested stages with different numbers of substages:

```ruby
heavily_nested_progress = Headway::Progress.new
heavily_nested_progress.start_multistage_process stages: 5
# each stage is 20% overall progress
progress.set_complete
# 20% complete
heavily_nested_progress.start_multistage_process stages: 2
# each sub-stage is half of the original 20% stage (10% of overall progress)
progress.set_complete
# 30% complete
heavily_nested_progress.start_multistage_process stages: 3
# each sub-stage is a third of the 10% of the parent sub-stage (3.3% of overall progress)
progress.set_percentage 47.0

progress.percentage
 # => 31.551
```

The above stage nesting would look like this:

Stage 1 (20%)
  Stage 1.1 (10%)
  Stage 1.2 (10%)
    Stage 1.2.1 (3.3%)
    Stage 1.2.2 (3.3%)
    Stage 1.2.3 (3.3%)
Stage 2 (20%)
Stage 3 (20%)
Stage 4 (20%)
Stage 5 (20%)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/headway. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Headway project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/headway/blob/master/CODE_OF_CONDUCT.md).
