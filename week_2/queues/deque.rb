class Deque
  attr_accessor :first, :last

  def initialize
    self.first = nil
    self.last = nil
  end

  def add_first(item)
    oldfirst = first
    self.first = Node.new(item, nil, oldfirst)
    oldfirst.nil? ? self.last = first : oldfirst.prev = first
  end

  def add_last(item)
    oldlast = last
    self.last = Node.new(item, oldlast, nil)
    oldlast.nil? ? self.first = last : oldlast.next = last
  end

  def remove_first
    raise if is_empty?
    item = first.item
    self.first = first.next
    first.nil? ? self.last = nil : first.prev = nil
    item
  end

  def remove_last
    raise if is_empty?
    item = last.item
    self.last = last.prev
    last.nil? ? self.first = nil : last.next = nil
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
  Node = Struct.new(:item, :prev, :next)
end
