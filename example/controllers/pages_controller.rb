class PagesController < Chickenpox::Controller
  def foo
    res.write('foo!!')
  end

  def index
    res.write('Hello!!')
  end

  def not_found
    res.status = 404
    res.write('Not found!')
  end
end
