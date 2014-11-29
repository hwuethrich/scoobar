require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'

# Use poltergeist for browser testing
Capybara.javascript_driver = :poltergeist

Capybara::Screenshot.autosave_on_failure = true

# Keep only the screenshots generated from the last failing test suite
Capybara::Screenshot.prune_strategy = :keep_last_run

