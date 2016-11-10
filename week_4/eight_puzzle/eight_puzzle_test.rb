require 'minitest/autorun'
require_relative 'eight_puzzle.rb'

class BoardTest < Minitest::Test
  def test_goal
    goal_board = Board.new([[1,2,3], [4,5,6], [7,8,0]])

    assert_equal goal_board, Board.goal(3)
  end

  def test_is_goal
    goal_board = Board.new([[1,2,3], [4,5,6], [7,8,0]])
    not_goal_board = Board.new([[8,1,3], [4,2,6], [7,5,0]])
    another_not_goal_board = Board.new([[0,1,2], [3,4,5], [6,7,8]])

    assert_equal true, goal_board.is_goal?
    assert_equal false, not_goal_board.is_goal?
    assert_equal false, another_not_goal_board.is_goal?
  end

  def test_hamming
    board = Board.new([[8,1,3], [4,0,2], [7,6,5]])

    assert_equal 5, board.hamming
  end

  def test_manhattan
    board = Board.new([[8,1,3], [4,0,2], [7,6,5]])

    assert_equal 10, board.manhattan
  end

  def test_manhattan_distance
    assert_equal 1, Board.manhattan_distance([0,1], [0,0])
    assert_equal 3, Board.manhattan_distance([0,0], [2,1])
  end

  def test_position
    board = Board.new([[8,1,3], [4,0,2], [7,6,5]])

    assert_equal [0,0], board.position(8)
    assert_equal [1,2], board.position(2)
    assert_equal [1,1], board.position(0)
  end

  def test_in_range
    board = Board.new([[8,1,3], [4,0,2], [7,6,5]])

    assert_equal true, board.in_range?([0,0])
    assert_equal true, board.in_range?([1,2])
    assert_equal false, board.in_range?([1,3])
    assert_equal false, board.in_range?([5,0])
  end

  def test_neighbors
    board = Board.new([[8,1,3], [4,2,0], [7,6,5]])
    neighbor_one = [[8,1,3], [4,2,5], [7,6,0]]
    neighbor_two = [[8,1,0], [4,2,3], [7,6,5]]
    neighbor_three = [[8,1,3], [4,0,2], [7,6,5]]

    result_grids = board.neighbors.map { |n| n.grid }

    assert_equal [neighbor_one, neighbor_two, neighbor_three], result_grids
  end

  def test_switch
    board = Board.new([[8,1,3], [4,2,0], [7,6,5]])
    board.switch([0,0], [1,2])

    assert_equal [[0,1,3], [4,2,8], [7,6,5]], board.grid
  end
end
