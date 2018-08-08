class MaxHeap
  attr_reader :arr
  attr_reader :max_size

  class GreaterThanMaxSizeError < StandardError; end

  def initialize(arr = [] , max_size = 0)
    @arr = arr
    @max_size = max_size
  end

  def insert(element)
    raise GreaterThanMaxSizeError unless arr.size < max_size
    arr << element
    k = arr.size - 1

    if arr[k/2] < arr[k]
      swim(k)
    end
  end

  def pop
    delete(0)
  end

  def max
    arr[0]
  end

  private

  def delete(k)
    swap(k, arr.size - 1)
    result = arr.pop

    sink(k)
    result
  end

  def sink(k)
    while child_index(k) < arr.size
      # account for possible nil right child
      if arr[child_index(k) + 1].nil?
        puts "swapping index #{k} with #{k * 2}"
        swap(k, child_index(k))
        k = child_index(k)
        next
      end

      if arr[child_index(k)] >= arr[(child_index(k)) + 1]
        j = child_index(k)
      else
        # make sure to take the greater of the two children
        j = (child_index(k)) + 1
      end
      puts "swapping index #{k} with #{j}"
      swap(k, j)
      k = child_index(k)
    end
  end

  def swim(k)
    while k >= 1 && arr[k / 2] < arr[k]
      swap(k / 2, k)
      k /= 2
    end
  end

  def swap(x, y)
    temp = arr[x]
    arr[x] = arr[y]
    arr[y] = temp
  end

  def child_index(k)
    return 1 if k == 0
    k * 2
  end
end
