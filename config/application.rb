# frozen_string_literal: true

require File.expand_path('boot', __dir__)
require 'rails/all'

Bundler.require(*Rails.groups)

module DevAdventures
  class Application < Rails::Application
    # config.active_record.raise_in_transactional_callbacks = true
  end
end
