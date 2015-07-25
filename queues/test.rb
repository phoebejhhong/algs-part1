require 'minitest/autorun'
require_relative 'deque.rb'

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
