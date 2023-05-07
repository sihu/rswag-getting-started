# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module RswagPlayground
  class Application < Rails::Application
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        # either check for the origin or use a API_TOKEN
        origins '*'
        resource '*',
                 headers: :any,
                 methods: %i[get post put patch delete options head],
                 max_age: 600,
                 # You can expose all headers `expose: *` or just the ones you need - f.e. for JWT
                 expose: %w[access-control-allow-origin access-control-expose-headers access-control-max-age
                            Authorization ETag x-api-token]
      end
    end
  end
end
