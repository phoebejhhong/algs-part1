require 'minitest/autorun'
require_relative 'deque.rb'
require_relative 'randomized_queue.rb'

class DequeTest < Minitest::Test
  def setup
    @dq = Deque.new
  end

  def test_add_first
    @dq.add_first(5)
    assert_equal 5, @dq.first.item
    assert_equal 5, @dq.last.item

    @dq.add_first(4)
    assert_equal 4, @dq.first.item
    assert_equal 5, @dq.last.item
  end

  def test_add_last
    @dq.add_last(5)
    assert_equal 5, @dq.first.item
    assert_equal 5, @dq.last.item

    @dq.add_last(6)
    assert_equal 5, @dq.first.item
    assert_equal 6, @dq.last.item
  end

  def test_remove_first
    @dq.add_first(5)
    @dq.add_first(4)

    assert_equal 4, @dq.remove_first
    assert_equal 5, @dq.first.item
    assert_equal 5, @dq.last.item

    assert_equal 5, @dq.remove_first
    assert_equal nil, @dq.first
    assert_equal nil, @dq.last

    assert_raises { @dq.remove_first }
  end

  def test_remove_last
    @dq.add_last(5)
    @dq.add_last(6)

    assert_equal 6, @dq.remove_last
    assert_equal 5, @dq.first.item
    assert_equal 5, @dq.last.item

    assert_equal 5, @dq.remove_last
    assert_equal nil, @dq.first
    assert_equal nil, @dq.last

    assert_raises { @dq.remove_last }
  end

  def test_each
    @dq.add_last(5)
    @dq.add_last(6)
    @dq.each { |node| node.item += 1 }

    assert_equal 6, @dq.first.item
    assert_equal 7, @dq.last.item
  end
end

class RandomizedQueueTest < Minitest::Test
  def setup
    @rq = RandomizedQueue.new
  end

  def test_enqueue
    @rq.enqueue(5)
    assert_equal 1, @rq.size
  end

  def test_dequeue
    # not going to test randomness
    @rq.enqueue(5)
    @rq.enqueue(6)
    @rq.enqueue(7)
    @rq.enqueue(8)
    outputs = []
    4.times { outputs << @rq.dequeue}

    assert_equal [5, 6, 7, 8], outputs.sort
    assert_equal 0, @rq.size
  end

end
