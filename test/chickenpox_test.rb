setup do
  @env = { "REQUEST_METHOD" => "GET", "PATH_INFO" => "/", "SCRIPT_NAME" => "/" }
  Chickenpox::Controller.new(@env)
end

routes = {
  GET: "PagesController#home"
}

class PagesController < Chickenpox::Controller
  def home
    res.write('Hello!!')
  end
end

test "controller exposes a req object" do |c|
  req = c.req

  assert req.is_a?(Rack::Request)
  assert_equal 'GET', req.request_method
  assert_equal '/', req.path_info
  assert_equal '/', req.script_name
end

test "controller exposes a resp object" do |c|
  res = c.res

  assert res.is_a?(Rack::Response)
  assert res.body.empty?
end

test "contrlller exposes an env hash" do |c|
  env = c.env
  assert_equal env, @env
end


test "app" do
  app = Chickenpox::App.new(routes)
  res = app.call(@env)

  assert_equal ['Hello!!'], res.body
end
