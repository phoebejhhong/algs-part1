require 'minitest/autorun'
require_relative 'priority_queue.rb'

class PriorityQueueTest < Minitest::Test
  def test_elementary_min_priority_queue
    pq = ElementaryMinPriorityQueue.new

    pq.insert(5)
    pq.insert(9)
    pq.insert(3)
    pq.insert(7)

    assert_equal 3, pq.delete_min
  end

  def test_binary_heap_max_priority_queue
    pq = BinaryHeapMaxPriorityQueue.new

    pq.insert(5)
    pq.insert(9)
    pq.insert(3)
    pq.insert(7)

    assert_equal 9, pq.delete_max
  end
end
