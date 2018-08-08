class Queue

  def initialize
    @stack_a = []
    @stack_b = []
  end

  def enqueue(n)
    if stack_a.empty?
      transfer(from: stack_b, to: stack_a)
    end
    return true if stack_a << n
  end

  def dequeue
    if stack_b.empty?
      transfer(from: stack_a, to: stack_b)
    end
    stack_b.pop
  end

  private

  def transfer(from:, to:)
    until from.empty?
      to << from.pop
    end
  end

  attr_accessor :stack_a
  attr_accessor :stack_b
end
