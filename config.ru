require 'sinatra'
require 'sinatra/contrib'
require_relative './controllers/teams_controller'

use Rack::MethodOverride


run TeamController
