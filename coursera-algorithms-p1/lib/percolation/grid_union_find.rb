module Percolation
  class GridUnionFind
    attr_reader :grid_data
    attr_reader :uf
    attr_reader :n

    def initialize(n, grid)
      @n = n # single dimension's length
      @uf = UnionFind.new(n * n)
      @grid_data = grid.data
    end

    # Check all adjacent directions from i and perform #union with that
    # new index and current index i to simulate a 'connection'
    def check_directions_from(i)
      # grid_data[up(i)] will return true if that block is 'true', or 'opened'
      union(i, up(i)) if in_bounds?(i, up(i)) && grid_data[up(i)]
      union(i, down(i)) if in_bounds?(i, down(i)) && grid_data[down(i)]
      union(i, right(i)) if not_over_right_side?(i) && grid_data[right(i)]
      union(i, left(i)) if not_over_left_side?(i) && grid_data[left(i)]
    end

    private

    def check_direction(adjacent_i, i)
      union(i, adjacent_i) if in_bounds?(i, adjacent_i) && grid_data[adjacent_i]
    end

    def union(i, adjacent_i)
      uf.union(i, adjacent_i)
    end

    # Only checks up/down bounds
    def in_bounds?(i, adjacent_i)
      adjacent_i >= 0 && adjacent_i <= n
    end

    def not_over_right_side?(i)
      # if index is in first column, it wrapped from right to next row's left
      (i % n) != (n - 1)
    end

    def not_over_left_side?(i)
      # if index is in far right, it wrapped from far left to prev row's right
      (i % n) != 0
    end

    def up(i)
      i - n
    end

    def down(i)
      i + n
    end

    def right(i)
      i + 1
    end

    def left(i)
      i - 1
    end
  end
end
