describe MaxHeap do
  let(:mh) { MaxHeap.new([5,4,1,2,0]) }

  describe 'insert' do
    it 'increases the size by 1' do
      mh.insert(0)
      expect(mh.arr.size).to eq(6)
      expect(valid?(mh.arr)).to eq(true)
    end

    context 'when the inserted value is the largest' do
      it 'gets inserted at index 1' do
        mh.insert(10)
        expect(mh.arr).to eq([10, 5, 4, 2, 0, 1])
        expect(valid?(mh.arr)).to eq(true)
      end
    end

    context 'when the inserted value is the smallest' do
      it 'gets inserted at the end' do
        mh.insert(0)
        expect(mh.arr).to eq([5, 4, 1, 2, 0, 0])
        expect(valid?(mh.arr)).to eq(true)
      end
    end

    context 'when the inserted value is in the middle' do
      it 'gets inserted in the correct place' do
        mh.insert(3)
        expect(mh.arr).to eq([5,4,3,2,0,1])
        expect(valid?(mh.arr)).to eq(true)
      end
    end
  end

  describe 'delete' do
    it 'returns the element and removes it from the heap' do
      expect(mh.delete(0)).to eq(5)
      expect(mh.arr).to eq([4,2,1,0])

      expect(mh.delete(2)).to eq(1)
      expect(mh.arr).to eq([4,2,0])
      expect(valid?(mh.arr)).to eq(true)
    end
  end
end

def valid?(arr)
  arr.each_with_index do |el, i|
    return false if arr[i * 2] && el < arr[i * 2]
    return false if arr[(i * 2) + 1] && el < arr[(i * 2) + 1]
  end
  true
end
