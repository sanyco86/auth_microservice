require_relative 'config/environment'

use Rack::RequestId
use Rack::Runtime
use Rack::Deflater
use Prometheus::Middleware::Collector
use Prometheus::Middleware::Exporter
use Rack::RequestId
use Rack::Ougai::LogRequests, Application.logger

run Rack::URLMap.new(
  '/api/v1/sign_up' => UserRoutes,
  '/api/v1/sign_in' => UserSessionRoutes,
  '/api/v1/auth'    => AuthRoutes
)
