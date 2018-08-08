describe MergeSort do
  let(:ms) { MergeSort.new }

  describe 'sort' do
    it 'sorts two presorted halfs into one' do
      let(:input) { [4,5,6,1,2,3] }
      expect(ms.sort(input)).to eq([1,2,3,4,5,6])
    end

    it 'sorts an odd numbered array' do
      let(:input) { [4,5,6,1,2,3,10] }
      expect(ms.sort(input)).to eq([1,2,3,4,5,6,10])
    end
  end
end
