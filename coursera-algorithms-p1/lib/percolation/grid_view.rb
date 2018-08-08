require_relative 'union_find'

module Percolation
  class GridView
    attr_reader :n
    attr_accessor :data
    attr_accessor :closed_positions

    class NoMorePositionsError < StandardError; end

    def initialize(n)
      @n = n
      @data = Array.new(n * n) { false } # initialize with all 'closed' positions
      @uf = UnionFind.new(n) # inject our data to UF algorithm
      @closed_positions = Array.new(n * n) { |i| i }
    end

    def tick!
      raise NoMorePositionsError unless closed_positions.length > 0
      index_to_tick = closed_positions.sample
      data[index_to_tick] = true
      closed_positions.delete(index_to_tick)
      index_to_tick
    end

    def print
      (1..n).each do |row|
        puts print_row(row)
      end
    end

    def print_row(row)
      row_num = row - 1
      result = ""
      start = row_num * n
      fin = (row_num * n) + n - 1
      (start..fin).each do |i|
        result += "#{print_cell(data[i])}"
      end
      result
    end

    def print_cell(data)
      if data
        '◽'
      else
        '◾'
      end
    end
  end
end
