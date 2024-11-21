# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # TODO: move to config
    origins 'http://localhost:3000' # React app host

    resource '*',
             headers: :any,
             methods: [:get, :post, :put, :patch, :delete, :options, :head],
             credentials: true # Set to true if you need to send cookies or authentication headers
  end
end
