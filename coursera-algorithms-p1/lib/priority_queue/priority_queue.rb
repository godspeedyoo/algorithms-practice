require_relative './lib/heap/max_heap.rb'

class PriorityQueue
  def initialize(arr = [], max_size)
    @mh = ::MaxHeap.new(arr, max_size)
  end

  def pop
    mh.pop
  end

  def push(el)
    mh.insert(el)
  end

  def <<(el)
    push(el)
  end

  private

  def mh
    @mh
  end
end
