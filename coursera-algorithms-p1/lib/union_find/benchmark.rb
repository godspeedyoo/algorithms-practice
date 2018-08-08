# require 'benchmark'
# require_relative 'union_find'
#
# n = 1000
# puts "Quick UnionFind path_compression: false, weighted_trees: false"
#
# 5.times do |i|
#   puts "testing size of #{n}"
#   uf = UnionFind.new(n)
#   n.times do
#     uf.union(rand(0...n), rand(0...n))
#   end
#   Benchmark.bm(7) { |x|
#     n.times do
#       uf.connected?(rand(0...n), rand(0...n))
#     end
#   }
# end
