require 'hart'
require 'rack'

require_relative './chickenpox/controller'

module Chickenpox
  class App
    REQUEST_METHOD = 'REQUEST_METHOD'.freeze
    PATH_INFO = 'PATH_INFO'.freeze

    attr_reader :env

    def initialize(routes)
      @routes = routes
      @h = Hart.new(@routes)
    end

    def call(env)
      @env = env
      controller_object = controller_class.new(env)
      action_result = controller_object.send(action)

      controller_object.res
    end

    private

    def action
      hart_result[1]
    end

    def controller
      hart_result[0]
    end

    def controller_class
      Object.const_get(controller)
    end

    def hart_result
      @hart_result ||= @h.call(env[REQUEST_METHOD], env[PATH_INFO]).split('#')
    end
  end
end
