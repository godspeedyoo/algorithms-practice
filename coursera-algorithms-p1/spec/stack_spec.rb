describe StackWithMax do
  subject { StackWithMax.new(data) }
  let(:data) { [] }

  describe 'push' do
    it 'returns true' do
      expect(subject.push(5)).to eq(true)
    end
  end

  describe 'pop' do
    let(:data) { [1,2,3,4,5] }
    it 'returns objects in FILO order' do
      expect(subject.pop).to eq(5)
      expect(subject.pop).to eq(4)
      expect(subject.pop).to eq(3)
      expect(subject.pop).to eq(2)
      expect(subject.pop).to eq(1)
    end
  end

  describe 'max' do
    let(:data) { [4,2,5,6,1] }
    it 'returns the max value in the stack' do
      expect(subject.max).to eq(6)
      subject.pop
      expect(subject.max).to eq(6)
      subject.pop
      expect(subject.max).to eq(5)
      subject.pop
      expect(subject.max).to eq(4)
    end
  end
end
