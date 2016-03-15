class RandomizedQueue
  attr_accessor :items

  def initialize
    self.items = []
  end

  def size
    items.size
  end

  def enqueue(item)
    items << item
  end

  # remove and return a random item
  def dequeue
    raise if is_empty?
    random_idx = rand(size)
    random_item = items[random_idx]
    # assign the last item to the selected idx and remove it
    items[random_idx] = items.last
    items.delete_at(size - 1)

    random_item
  end

  # return (but do not remove) a random item
  def sample
    items[rand(size)]
  end

  def is_empty?
    size == 0
  end
end
