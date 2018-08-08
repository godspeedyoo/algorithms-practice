class LinkedList
  attr_reader :head
  attr_accessor :tail

  def initialize(head_node)
    @head = head_node || Node.new
  end

  def append(node)
    current_node = head
    while current_node.next != nil
      current_node = current_node.next
    end
    current_node.next = node
    self.tail = node
  end

  class Node
    attr_accessor :data
    attr_accessor :next

    def initialize(data = nil)
      @data = data
      @next = nil
    end
  end
end
