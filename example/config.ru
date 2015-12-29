require 'chickenpox'
require_relative './controllers/pages_controller'

routes = {
  default: "PagesController#not_found",

  GET: "PagesController#index",
  "foo" => {
    GET: "PagesController#foo"
  }
}

run Chickenpox::App.new(routes)
