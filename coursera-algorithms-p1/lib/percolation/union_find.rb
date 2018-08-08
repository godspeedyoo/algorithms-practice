module Percolation
  class UnionFind
    attr_accessor :data

    def initialize(size)
      @data = Array.new(size) { |i| i }
    end

    def connected?(i, j)
      root(i) == root(j)
    end

    def union(i, j)
      data[root(i)] = root(j)
    end

    private

    def root(i)
      until data[i] == i do
        i = data[i]
      end
      i
    end
  end
end
