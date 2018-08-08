# require_relative 'grid_view'
# require_relative 'grid_union_find'
#
# module Percolation
#   class Runner
#     def self.run(n)
#       grid = ::Percolation::GridView.new(n)
#       grid_uf = ::Percolation::GridUnionFind.new(n, grid)
#
#       while true do
#         ticked_index = grid.tick!
#         grid_uf.check_directions_from(ticked_index)
#
#         grid.print
#         sleep (0.01)
#         system 'clear'
#       end
#
#     rescue GridView::NoMorePositionsError => e
#       grid.print
#       puts "Done!"
#     end
#   end
# end
#
# Percolation::Runner.run(40)
