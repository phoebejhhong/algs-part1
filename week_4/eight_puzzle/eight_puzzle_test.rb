require 'minitest/autorun'
require_relative 'eight_puzzle.rb'

class BoardTest < Minitest::Test
  def test_goal
    goal_board = Board.new([[1,2,3], [4,5,6], [7,8,nil]])

    assert_equal goal_board, Board.goal(3)
  end

  def test_is_goal
    goal_board = Board.new([[1,2,3], [4,5,6], [7,8,nil]])
    not_goal_board = Board.new([[8,1,3], [4,2,6], [7,5,nil]])
    another_not_goal_board = Board.new([[nil,1,2], [3,4,5], [6,7,8]])

    assert_equal true, goal_board.is_goal?
    assert_equal false, not_goal_board.is_goal?
    assert_equal false, another_not_goal_board.is_goal?
  end
end
