class Queue
  def initialize
    @stack = []
  end
  def enqueue(el)
    @stack << el
    el
  end

  def dequeue
    @stack.pop
  end

  def show
    @stack.dup
  end


end
