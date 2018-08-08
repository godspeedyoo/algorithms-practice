describe Queue do
  subject { Queue.new }

  describe 'enqueue' do
    context 'when passing single object' do
      it 'returns true' do
        expect(subject.enqueue(1)).to eq(true)
      end
    end

    context 'when passing array of objects' do
      it 'returns true' do
        expect(subject.enqueue([1,'2',Object.new])).to eq(true)
      end
    end
  end

  describe 'dequeue' do
    it 'returns in FIFO order data which was enqueued' do
      subject.enqueue(1)
      subject.enqueue(2)
      subject.enqueue(3)
      expect(subject.dequeue).to eq(1)
      expect(subject.dequeue).to eq(2)
      expect(subject.dequeue).to eq(3)
    end
  end
end
