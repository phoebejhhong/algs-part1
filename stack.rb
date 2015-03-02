# Algorithms, Part I, Week2, Stacks and Queues

# Linked-list implementation of stack
class Stack

  attr_accessor :first

  def initialize
    self.first = nil
  end

  def push(item)
    oldfirst = first
    self.first = Node.new
    first.item = item
    first.next = oldfirst
  end

  def pop
    raise if is_empty?
    item = first.item
    self.first = first.next

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

# Fixed-capacity array implementation of stack
class FixedCapacityStack
  attr_accessor :stack, :idx

  def initialize(capacity)
    self.stack = Array.new(capacity)
    self.idx = 0
  end

  def is_empty?
    idx == 0
  end

  def push(item)
    stack[idx] = item
    self.idx += 1
  end

  def pop
    raise if is_empty?
    self.idx -= 1
    item = stack[idx]
    stack[idx] = nil

    item
  end
end

# Resizing array implementation of stack
class ResizingArray
  attr_accessor :stack, :idx

  def initialize
    self.stack = Array.new(1)
    self.idx = 0
  end

  def is_empty?
    idx == 0
  end

  def push(item)
    # double the size of array when full
    resize(stack.length * 2) if idx == stack.length

    stack[idx] = item
    self.idx += 1
  end

  def pop
    raise if is_empty?
    self.idx -= 1
    item = stack[idx]
    stack[idx] = nil
    # halve size of array when one-quater full
    if idx > 0 && idx == (stack.length/4)
      resize(stack.length / 2)
    end

    item
  end

  def resize(capacity)
    copy = Array.new(capacity)
    (0..capacity-1).each { |idx| copy[idx] = stack[idx] }
    self.stack = copy
  end

  def each(&block)
    stack.each { |item| block.call(item) }
  end
end
