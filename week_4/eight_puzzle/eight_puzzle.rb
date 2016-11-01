require_relative '../priority_queue'

class EightPuzzleSolver
  def initialize(blocks)
    @board = Board.new(blocks)
    @priority_queue = BinaryHeap.new
  end
end


class Board
  attr_accessor :grid, :dimension, :num_of_moves

  def initialize(blocks)
    @dimension = blocks.size
    @grid = blocks
    @num_of_moves = 0
  end

  def self.goal(dimension)
    goal_blocks = []
    (1..dimension**2-1).to_a.each do |block|
      if block % 3 == 1
        goal_blocks << [block]
      else
        goal_blocks.last << block
      end
    end
    goal_blocks.last << nil

    Board.new(goal_blocks)
  end

  def self.manhattan_distance(first_position, second_position)
    (first_position.reduce(:+) - second_position.reduce(:+)).abs
  end

  def goal
    Board.goal(dimension)
  end

  def is_goal?
    self == goal
  end

  def position(target_block)
    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        return [i,j] if block == target_block
      end
    end
  end

  def hamming
    num_of_wrong_position_blocks = 0

    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        goal_block = goal[i][j]
        # ignore if goal_block is nil
        if goal_block && block != goal_block
          num_of_wrong_position_blocks += 1
        end
      end
    end

    num_of_wrong_position_blocks + num_of_moves
  end

  def manhattan
    sum_of_manhattan_distance = 0
    grid.each_with_index do |row, i|
      row.each_with_index do |block, j|
        goal_position = goal.position(block)
        sum_of_manhattan_distance += Board.manhattan_distance([i, j], goal_position)
      end
    end

    sum_of_manhattan_distance + num_of_moves
  end

  def twin

  end

  def ==(another_board)
    grid == another_board.grid
  end

  def [](i)
    grid[i]
  end

  def neighbors

  end

  def to_s

  end
end
