module Chickenpox
  class Controller
    attr_reader :env, :req, :res

    def initialize(env)
      @env = env
      @req = Rack::Request.new(@env)
      @res = Rack::Response.new
    end
  end
end
