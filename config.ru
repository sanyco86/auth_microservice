require_relative 'config/environment'

run Rack::URLMap.new(
  '/api/v1/sign_up' => UserRoutes,
)
