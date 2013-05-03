require 'sequel'
require 'workflow'
require 'workflow_sequel_adapter'
require 'minitest/autorun'

if RUBY_PLATFORM == "java"
  DB = Sequel.connect('jdbc:sqlite::memory:')
else
  DB = Sequel.sqlite
end

Sequel::Model.raise_on_save_failure = false

DB.instance_eval do
  create_table :users do
    primary_key :id
    String :email
    String :password
    String :state
  end
end

class User < Sequel::Model
  include Workflow
  include WorkflowSequelAdapter

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

class MiniTest::Spec
  before do
    Sequel::Model.db.from(:users).truncate
  end
end