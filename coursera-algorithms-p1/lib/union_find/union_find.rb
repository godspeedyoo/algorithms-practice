class UnionFind

  def initialize(size)
    @data = Array.new(size) { |i| i } # Fill array with index as value
  end

  def connected?(p, q)
    return ElementNotFoundError unless data[p] && data[q]
  end

  private

  attr_reader :data
end
