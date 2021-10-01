require_relative 'config/environment'

run Rack::URLMap.new(
  '/api/v1/sign_up' => UserRoutes,
  '/api/v1/sign_in' => UserSessionRoutes,
  '/api/v1/auth'    => AuthRoutes
)
