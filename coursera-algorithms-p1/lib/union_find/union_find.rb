class UnionFind
  attr_accessor :data, :size, :path_compression, :weighted_trees, :largest_in_tree

  class ElementNotFoundError < StandardError; end

  def initialize(size, path_compression = false, weighted_trees = false)
    @data = Array.new(size) { |i| i } # Fill array with index as value
    @size = Array.new(size) { 1 }
    @largest_in_tree = Array.new(size) { |i| i } # Each starting node is it's own largest value in sub tree
  end

  def connected?(i, j)
    raise ElementNotFoundError unless data[i] && data[j]
    root(i) == root(j)
  end

  def union(i, j)
    weighted_union(i, j) if weighted_trees
    naive_union(i, j)
  end

  # Return the largest value that i is connected to.
  def find_largest(i)
    largest_in_tree[root(i)]
  end

  private

  def naive_union(i, j)
    data[root(i)] = root(j)
  end

  def weighted_union(i, j)
    if size[j] >= size[i]
      data[root(i)] = root(j)
      size[j] += size[i]
    else
      data[root(j)] = root(i)
      size[i] += size[j]
    end
    update_largest_in_tree(i, j)
  end

  def update_largest_in_tree(i, j)
    if largest_in_tree[root(i)] >= largest_in_tree[root(j)]
      largest[root(j)] = largest[root(i)]
    else
      largest[root(i)] = largest[root(j)]
    end
  end

  def root(i)
    # assume there will always be at least 1 element whose index refers to
    # its value (a root node)
    while data[i] != i
      # data[i] = data[data[i]]
      i = data[i]
    end
    i
  end
end
