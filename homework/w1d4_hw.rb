class Stack
  def initialize
    @ivar = []
  end

  def add(el)
    @ivar << el
    el
  end

  def remove
    @ivar.pop
  end

  def show
    @ivar.dup
  end

end
