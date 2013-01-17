# workflow_sequel_adapter

This gem is a persistence adapter for the [Workflow](http://github.com/geekq/workflow) gem. All you do is include this adapter, and `Workflow` will use the `workflow_column` to retrieve and persist the workflow state.

Workflow is a state machine gem you can include to add state machine functionality to your classes.

## Installation

Add this line to your application's Gemfile:

    gem 'workflow_sequel_adapter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install workflow_sequel_adapter

## Usage

```ruby
class User < Sequel::Model
  include Workflow
  # include the adapter after including Workflow
  include WorkflowSequelAdapter

  # uses 'state' as the workflow_column instead of 'workflow_state'
  workflow_column :state

  workflow do
    state :active do
      event :deactivate, transition_to: :inactive
    end

    state :inactive do
      event :activate, transition_to: :active
    end
  end
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
