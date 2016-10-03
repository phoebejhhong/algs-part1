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

class BinaryHeapMaxPriorityQueue
  attr_accessor :pq

  def initialize
    # array representation of binary heap incides start at 1
    @pq = [nil]
  end

  def swim(idx)
    while idx > first_idx && less(idx/2, idx)
      exchange(idx, idx/2)
      idx = idx/2
    end
  end

  def sink(idx)
    while idx*2 <= last_idx
      child_idx = idx*2
      if child_idx < last_idx && less(child_idx, child_idx + 1)
        child_idx += 1
      end
      return unless less(idx, child_idx)

      exchange(idx, child_idx)
      idx = child_idx
    end
  end

  def insert(key)
    pq.push(key)
    swim(last_idx)
  end

  def delete_max
    exchange(first_idx, last_idx)
    max = pq.pop
    sink(first_idx)

    max
  end

  def first_idx
    1
  end

  def last_idx
    pq.size - 1
  end

  def less(idx_one, idx_two)
    pq[idx_one] < pq[idx_two]
  end

  def exchange(idx_one, idx_two)
    pq[idx_one], pq[idx_two] = pq[idx_two], pq[idx_one]
  end
end
