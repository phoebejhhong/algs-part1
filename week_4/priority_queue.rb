# Algorithms, Part I, Week 4, Priority Queues

class ElementaryMinPriorityQueue
  attr_accessor :pq

  def initialize
    self.pq = []
  end

  def insert(key)
    pq.push(key)
  end

  def delete_min
    pq.delete(min)
  end

  def min
    min_value = pq[0]
    pq.each do |element|
      min_value = element if element < min_value
    end

    min_value
  end

  def is_empty?
    pq.empty?
  end
end
