describe Percolation::UnionFind do
  let(:uf) { Percolation::UnionFind.new(5) }

  describe 'connected?' do
    it 'returns true for the same nodes' do
      expect(uf.connected?(0, 0)).to eq(true)
    end

    it 'returns true for two nodes with the same root' do
      uf.union(2, 3)
      uf.union(3, 4)
      expect(uf.connected?(2,4)).to eq(true)
      expect(uf.connected?(4,2)).to eq(true)
    end

    it 'returns false for two unconnected nodes' do
      expect(uf.connected?(0, 1)).to eq(false)
    end
  end

  describe 'union' do
    it 'sets the root of i to the root of j' do
      uf.union(0, 1)
      uf.union(1, 2)
      uf.union(2, 3)
      expect(uf.connected?(0,3)).to eq(true)
      expect(uf.connected?(1,3)).to eq(true)
      expect(uf.connected?(0,2)).to eq(true)
    end
  end
end
