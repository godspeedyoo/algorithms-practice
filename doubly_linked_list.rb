class DoublyLinkedList
  attr_reader :head, :tail

  def initialize(data)
    populate_data(data)
  end

  private

  def populate_data(data)
    return false if data.empty?

    prev_node = nil
    data.each_with_index do |obj, i|
      if i == 0
        @head = Node.new(obj)
        prev_node = head
        @tail = head
        next
      end

      current_node = Node.new(obj)
      insert_after(prev_node, current_node)
      prev_node = current_node
    end
  end

  def insert_after(current_node, next_node)
    # puts "insert after #{current_node.data}, #{next_node.data}"
    current_node.next = next_node
    next_node.prev = current_node
    @tail = next_node
  end
end

class Node
  attr_accessor :data, :next, :prev

  def initialize(data)
    @data = data
  end
end

sample_data_one = ['a', 2, 3]
sample_data_two = ['zzz']

p DoublyLinkedList.new(sample_data_one).head.data == 'a'
p DoublyLinkedList.new(sample_data_one).tail.data == 3
p DoublyLinkedList.new(sample_data_one).head.next.data == 2
p DoublyLinkedList.new(sample_data_one).tail.prev.data == 2
p DoublyLinkedList.new(sample_data_two).tail.data == 'zzz'
p DoublyLinkedList.new(sample_data_two).head.data == 'zzz'
