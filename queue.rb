# Algorithms, Part I, Week2, Stacks and Queues

# Linked-list implementation of stack
class Queue
  attr_accessor :first, :last

  def initialize
    self.first = nil
    self.last = nil
  end

  def enqueue(item)
    oldlast = last
    self.last = Node.new
    last.item = item
    last.next = nil
    is_empty? ? self.first = last : oldlast.next = last
  end

  def dequeue
    item = first.item
    self.first = first.next
    last = nil if is_empty?
    item
  end

  def is_empty?
    first.nil?
  end

  def each(&block)
    current_node = first
    while (current_node)
      block.call(current_node)
      current_node = current_node.next
    end
  end

  private
  # inner class
  class Node
    attr_accessor :item, :next
  end
end
